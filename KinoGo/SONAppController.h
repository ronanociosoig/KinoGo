//
//  SONAppController.h
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SONAppController : NSObject

+ (SONAppController*) sharedAppController;

- (void)loadCharts;
- (void)loadRunning;
- (void)loadUpcoming;

@end
