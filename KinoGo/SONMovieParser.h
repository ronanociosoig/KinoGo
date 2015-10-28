//
//  SONMovieParser.h
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SONMovie;

@interface SONMovieParser : NSObject

+(nullable NSArray <SONMovie*> *)parseResponse:(NSArray <NSDictionary*> * __nonnull)responseArray;

@end
