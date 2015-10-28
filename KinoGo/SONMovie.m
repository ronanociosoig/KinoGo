//
//  SONMovie.m
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import "SONMovie.h"

@implementation SONMovie


/*
 sTitle
 sOnesheetUrl
 sTrailerPoster
 iGenreId (NSInteger)
 iId (NSInteger)
 iPosition (NSInteger)
 iRuntime (NSInteger)
 
 */

- (nullable instancetype)initWithDictionary:(NSDictionary* __nonnull)movieDictionary {
    self = [super init];
    
    if (self) {
        self.title = movieDictionary[@"sTitle"];
        self.trailerPosterImageURLString = movieDictionary[@"sTrailerPoster"];
        self.frontPosterImageURLString = movieDictionary[@"sOnesheetUrl"];
        
        self.runtime = [movieDictionary[@"iRuntime"] integerValue];
        self.position = [movieDictionary[@"iPosition"] integerValue];
        self.movieId = [movieDictionary[@"iId"] integerValue];
        self.genreId = [movieDictionary[@"iGenreId"] integerValue];
        
    }
    
    return self;
}

@end
