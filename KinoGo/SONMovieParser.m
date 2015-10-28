//
//  SONMovieParser.m
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import "SONMovieParser.h"
#import "SONMovie.h"

@implementation SONMovieParser

+(nullable NSArray <SONMovie*> *)parseResponse:(NSArray* __nonnull)responseArray {
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithCapacity:[responseArray count]];
    for (NSDictionary *movieDict in responseArray) {
        SONMovie *movie = [[SONMovie alloc] initWithDictionary:movieDict];
        if (movie) {
            [mutableArray addObject:movie];
        }
    }
    
    return [NSArray arrayWithArray:mutableArray];
}

@end
