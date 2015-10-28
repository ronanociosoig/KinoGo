//
//  SONGetRequestHelper.h
//  SoundApp
//
//  Created by Ronan on 01/03/2014.
//  Copyright (c) 2014 Sonomos Software S.L. All rights reserved.
//

@import Foundation;

@interface SONGetRequestHelper : NSObject

+ (nonnull NSString*)urlEscapeString:(NSString * __nonnull)unencodedString;
+ (nonnull NSString*)addQueryStringToUrlString:(NSString * __nonnull)urlString withDictionary:(NSDictionary * __nonnull)dictionary;

@end
