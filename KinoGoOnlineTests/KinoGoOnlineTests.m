//
//  KinoGoOnlineTests.m
//  KinoGoOnlineTests
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SONDefines.h"
#import "SONNetworkingManager.h"
#import "SONNetworkingManager+DefaultPath.h"

@interface KinoGoOnlineTests : XCTestCase
{
    NSURL *url;
    NSMutableURLRequest *request;
    SONNetworkingManager *manager;
}

@end

@implementation KinoGoOnlineTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    manager = [SONNetworkingManager new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/*
 
 extern NSString *const kKinofinderWebserviceRoot;
 extern NSString *const kKinofinderWebserviceUrlCharts;
 */


- (void)testTheAPIReturnsValidData {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *requestPath = [NSString stringWithFormat:@"%@%@", kKinofinderWebserviceRoot,kKinofinderWebserviceUrlCharts];
    SONLog(@"Request path: %@", requestPath);
    url = [NSURL URLWithString:requestPath];
    XCTAssert(manager,@"Network manager must not be nil.");
    request = [manager requestForURL:url];
    XCTAssert(request,@"Request object must be valid.");
    // Given
    XCTestExpectation *validServerResponseExpectation = [self expectationWithDescription:@"valid response for HTTP request."];
    
    // When
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        NSLog(@"Response: %@", [response description]);
        if (httpResponse.statusCode >= kHTTP_RESPONSE_CODE_OK && httpResponse.statusCode < 300) {
            XCTAssert(YES,@"HTTP response should be greater than or equal to 200 and less than 300");
            
            NSError *jsonError;
            id jsonObject =
            [NSJSONSerialization JSONObjectWithData:data
                                            options:NSJSONReadingAllowFragments
                                              error:&jsonError];
            if (!jsonError) {
                XCTAssertTrue([jsonObject isKindOfClass:[NSArray class]], @"The JSON object response should be an array.");
                NSArray *jsonResponse = (NSArray*)jsonObject;
                XCTAssertNotNil(jsonResponse, @"Response should have valid JSON data.");
                [validServerResponseExpectation fulfill];
            } else {
                XCTFail(@"Error parsing the response. %@",[jsonError localizedDescription]);
            }
            
        } else {
            XCTFail(@"Error loading the response. %d", (int) httpResponse.statusCode);
        }
    }];
    [task resume];
    
    // Then
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        // nothing to do here
    }];
}

@end
