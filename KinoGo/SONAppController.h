//
//  SONAppController.h
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SONAppData;

@interface SONAppController : NSObject

@property (strong, nonatomic, nonnull) SONAppData *appData;

+ (nullable SONAppController*) sharedAppController;

- (void)loadCharts;
- (void)loadRunning;
- (void)loadUpcoming;

@end
