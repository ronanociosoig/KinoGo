//
//  SONNetworkingManager+DefaultPath.m
//  GlobalShop
//
//  Created by Ronan on 25/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import "SONNetworkingManager+DefaultPath.h"
#import "SONDefines.h"

/*
 
 extern NSString *const kKinofinderWebserviceRoot;
 extern NSString *const kKinofinderWebserviceUrlCharts;
 extern NSString *const kKinofinderWebserviceUrlRunning;
 extern NSString *const kKinofinderWebserviceUrlPreviews;
 
 */

@implementation SONNetworkingManager (DefaultPath)

- (void)getTaskForDefaultPathWithSuccessBlock:(SONSuccessBlock __nonnull)successBlock failureBlock:(SONFailureBlock __nonnull)failureBlock {
    NSString *defaultPath = [NSString stringWithFormat:@"%@%@",kKinofinderWebserviceRoot,kKinofinderWebserviceUrlCharts];
    [self getTaskForPath:defaultPath parameters:nil headerFields:nil successBlock:successBlock failureBlock:failureBlock];
}

- (void)getTaskForPreviewsWithSuccessBlock:(SONSuccessBlock __nonnull)successBlock failureBlock:(SONFailureBlock __nonnull)failureBlock {
    NSString *defaultPath = [NSString stringWithFormat:@"%@%@",kKinofinderWebserviceRoot,kKinofinderWebserviceUrlPreviews];
    [self getTaskForPath:defaultPath parameters:nil headerFields:nil successBlock:successBlock failureBlock:failureBlock];
}

- (void)getTaskForRunningWithSuccessBlock:(SONSuccessBlock __nonnull)successBlock failureBlock:(SONFailureBlock __nonnull)failureBlock {
    NSString *defaultPath = [NSString stringWithFormat:@"%@%@",kKinofinderWebserviceRoot,kKinofinderWebserviceUrlRunning];
    [self getTaskForPath:defaultPath parameters:nil headerFields:nil successBlock:successBlock failureBlock:failureBlock];
}

- (void)getTaskForChartsWithSuccessBlock:(SONSuccessBlock __nonnull)successBlock failureBlock:(SONFailureBlock __nonnull)failureBlock {
    [self getTaskForDefaultPathWithSuccessBlock:successBlock failureBlock:failureBlock];
}

@end
