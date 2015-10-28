//
//  SONDefines.m
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import "SONDefines.h"

NSString *const kKinofinderWebserviceRoot = @"http://api.kinofinder.de/1.0/movies/show";
NSString *const kKinofinderWebserviceUrlCharts = @"/charts";
NSString *const kKinofinderWebserviceUrlRunning = @"/running";
NSString *const kKinofinderWebserviceUrlPreviews = @"/previews";

NSString *const kSONHeaderCellIdentifier = @"HeaderCellIdentifier";
NSString *const kSONMovieCellIdentifier = @"MovieCellIdentifier";
NSString *const kSONHeaderCollectionCellIdentifier = @"HeaderCollectionCellIdentifier";
NSString *const kSONMovieCollectionCellIdentifier = @"MovieCollectionCellIdentifier";

const CGFloat grayTint = (74.0/255.0);

// HTTP codes
const NSInteger kHTTP_RESPONSE_CODE_OK = 200;
const NSInteger kHTTP_RESPONSE_CODE_NOT_MODIFIED = 304;
const NSInteger kHTTP_RESPONSE_CODE_NOT_FOUND = 404;

NSString *const kSONErrorDomain = @"KinoGoErrorDomain";