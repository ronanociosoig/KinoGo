//
//  SONDefines.h
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//


#ifndef NextFlix_SONDefines_h
#define NextFlix_SONDefines_h

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
extern NSString *const kSONHeaderCollectionCellIdentifier;
extern NSString *const kSONMovieCollectionCellIdentifier;

extern const CGFloat grayTint;

#define BACKGROUND_COLOR [UIColor colorWithRed:grayTint green:grayTint blue:grayTint alpha:1.0]
#define NAVIGATION_BAR_COLOR [UIColor colorWithRed:0.0 green:(187.0/255.0) blue:(211.0/255.0) alpha:1.0]

#define SONLog(format, ...)  NSLog(@"%s :: %@", __PRETTY_FUNCTION__,[NSString stringWithFormat:format, ## __VA_ARGS__])

#define BLOCK_PROPERTY @property (readwrite, copy)

typedef void (^VoidFnBlock)(void);
typedef void (^BoolFnBlock)(BOOL);
typedef void (^IntFnBlock)(int);
typedef void (^FloatFnBlock)(float);
typedef void (^StringFnBlock)(NSString*);
typedef BOOL (^StringReturningBoolFnBlock)(NSString*);
typedef void (^DictionaryFnBlock)(NSDictionary*);
typedef void (^ArrayFnBlock)(NSArray*);
typedef void (^DataFnBlock)(NSData*);
typedef void (^ErrFnBlock)(NSError*);
typedef void (^StringDictFnBlock)(NSString*,NSDictionary*);

#define ADD_WEAKSELF __weak __typeof__(self) weakSelf = self

#define DISPATCH_ON_MAIN(block) dispatch_async(dispatch_get_main_queue(), block)
#define DISPATCH_ON_BACKGROUND(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), block)

extern NSString *const kSONErrorDomain;
extern NSString *const kSONTaskCompletedNotification;

extern const NSInteger kHTTP_RESPONSE_CODE_OK;
extern const NSInteger kHTTP_RESPONSE_CODE_NOT_MODIFIED;
extern const NSInteger kHTTP_RESPONSE_CODE_NOT_FOUND;


#endif