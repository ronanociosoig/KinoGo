//
//  SONDefines.h
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

@import UIKit;

#import <Foundation/Foundation.h>

// API
extern NSString *const kKinofinderWebserviceRoot;
extern NSString *const kKinofinderWebserviceUrlCharts;
extern NSString *const kKinofinderWebserviceUrlRunning;
extern NSString *const kKinofinderWebserviceUrlPreviews;

// Table / Collection Views
extern NSString *const kSONHeaderCellIdentifier;
extern NSString *const kSONMovieCellIdentifier;

extern const CGFloat grayTint;

#define BACKGROUND_COLOR [UIColor colorWithRed:grayTint green:grayTint blue:grayTint alpha:1.0]
#define NAVIGATION_BAR_COLOR [UIColor colorWithRed:0.0 green:(187.0/255.0) blue:(211.0/255.0) alpha:1.0]