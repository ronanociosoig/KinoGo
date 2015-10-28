//
//  SONNetworkingManager.m
//  BookCatalog
//
//  Created by Ronan O Ciosoig on 13/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

@import UIKit;

#import "SONNetworkingManager.h"
#import "SONDefines.h"
#import "SONGetRequestHelper.h"
#import "Reachability.h"

@interface SONNetworkingManager()

@end

#define SHOW_NETWORK_ACTIVITY [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HIDE_NETWORK_ACTIVITY DISPATCH_ON_MAIN((^{[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;}))

@implementation SONNetworkingManager

- (instancetype)init {
    self = [super init];
    if (self) {
        self.httpMethod = @"GET"; // we need a default value
    }
    return self;
}

- (void)getTaskForPath:(NSString* __nonnull)path parameters:(NSDictionary* __nullable)parameters headerFields:(NSDictionary* __nullable)headerFields successBlock:(SONSuccessBlock __nonnull)successBlock failureBlock:(SONFailureBlock __nonnull)failureBlock {
    
    SHOW_NETWORK_ACTIVITY;
    NSURL *url = nil;
    if (parameters) {
        NSString *fullPath = [SONGetRequestHelper addQueryStringToUrlString:path withDictionary:parameters];
        url = [NSURL URLWithString:fullPath];
    } else {
        url = [NSURL URLWithString:[path copy]];
    }

    NSMutableURLRequest *request = [self requestForURL:url];
    request = [self insertEtagHeaderFieldFromHeaderFields:headerFields intoRequest:request];

    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        HIDE_NETWORK_ACTIVITY;
        
        if (error) {
            failureBlock(error);
        } else {
            NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
            NSDictionary *headerFields = [httpResp allHeaderFields];
            if (httpResp.statusCode == kHTTP_RESPONSE_CODE_OK) {
                NSError *jsonError;
                NSArray *jsonResponse =
                [NSJSONSerialization JSONObjectWithData:data
                                                options:NSJSONReadingAllowFragments
                                                  error:&jsonError];
                if (!jsonError) {
                    successBlock(headerFields,jsonResponse);
                } else {
                    NSLog(@"Error parsing JSON data");
                    failureBlock(jsonError);
                }
            } else {
                NSError *httpError = [NSError errorWithDomain:kSONErrorDomain code:httpResp.statusCode userInfo:@{@"LocalisedDescription":@"HTTP Server response code."}];
                failureBlock(httpError);
            }
        }
    }];
    [task resume];
}

#pragma mark - Helper Methods

- (NSMutableURLRequest*)requestForURL: (NSURL*)url {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = self.httpMethod;
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    if (self.authToken) {
        NSString *headerTokenString = [NSString stringWithFormat:@"Token token=%@", self.authToken];
        [request addValue:headerTokenString forHTTPHeaderField:@"Authorization"];
    }
    
    return request;
}

- (nonnull NSMutableURLRequest*)insertEtagHeaderFieldFromHeaderFields:(NSDictionary*)headerFields intoRequest:(NSMutableURLRequest* __nonnull)mutableRequest {
    NSString *etagValue = headerFields[@"Etag"];
    if (etagValue) {
        [mutableRequest addValue:etagValue forHTTPHeaderField:@"If-None-Match"];
    }
    return mutableRequest;
}

@end
