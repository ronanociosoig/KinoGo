//
//  SONAppController.m
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import "SONAppController.h"
#import "SONDefines.h"
#import "SONNetworkingManager+DefaultPath.h"

@interface SONAppController()
{
    SONNetworkingManager *manager;
}

@end

@implementation SONAppController

+ (SONAppController*) sharedAppController
{
    // Using GCD
    static dispatch_once_t once;
    static id sSONAppController;
    dispatch_once(&once, ^{
        sSONAppController = [[self alloc] init];
    });
    return sSONAppController;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        manager = [SONNetworkingManager new];
    }
    
    return self;
}

- (void)loadCharts {
    SONLog(@"");
    
    [manager getTaskForChartsWithSuccessBlock:^(NSDictionary * _Nullable headerFields, NSDictionary * _Nullable responseJSON) {
        
    } failureBlock:^(NSError * _Nullable error) {
        
    }];
}

- (void)loadRunning {
    SONLog(@"");
    
    [manager getTaskForRunningWithSuccessBlock:^(NSDictionary * _Nullable headerFields, NSDictionary * _Nullable responseJSON) {
        
    } failureBlock:^(NSError * _Nullable error) {
        
    }];
}

- (void)loadUpcoming {
    SONLog(@"");
    
    [manager getTaskForPreviewsWithSuccessBlock:^(NSDictionary * _Nullable headerFields, NSDictionary * _Nullable responseJSON) {
        
    } failureBlock:^(NSError * _Nullable error) {
        
    }];
}

@end
