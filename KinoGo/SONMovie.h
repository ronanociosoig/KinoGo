//
//  SONMovie.h
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SONMovie : NSObject


// sTitle
@property (strong, nonatomic) NSString * __nonnull title;

// sOnesheetUrl
@property (strong, nonatomic) NSString * __nonnull frontPosterImageURLString;

// sTrailerPoster
@property (strong, nonatomic) NSString * __nonnull trailerPosterImageURLString;


/*
 sTitle
 sOnesheetUrl
 sTrailerPoster
 iGenreId (NSInteger)
 iId (NSInteger)
 iPosition (NSInteger)
 iRuntime (NSInteger)
 
 */

@property (assign, nonatomic) NSInteger runtime;
@property (assign, nonatomic) NSInteger movieId;
@property (assign, nonatomic) NSInteger position;
@property (assign, nonatomic) NSInteger genreId;

- (nullable instancetype)initWithDictionary:(NSDictionary* __nonnull)movieDictionary;

@end
