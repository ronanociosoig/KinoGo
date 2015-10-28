//
//  SONNetworkingManager+SONNetworkingManager_Default.h
//  GlobalShop
//
//  Created by Ronan on 25/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import "SONNetworkingManager.h"

@interface SONNetworkingManager (DefaultPath)

- (void)getTaskForDefaultPathWithSuccessBlock:(SONSuccessBlock __nonnull)successBlock failureBlock:(SONFailureBlock __nonnull)failureBlock;

- (void)getTaskForPreviewsWithSuccessBlock:(SONSuccessBlock __nonnull)successBlock failureBlock:(SONFailureBlock __nonnull)failureBlock;

- (void)getTaskForRunningWithSuccessBlock:(SONSuccessBlock __nonnull)successBlock failureBlock:(SONFailureBlock __nonnull)failureBlock;

- (void)getTaskForChartsWithSuccessBlock:(SONSuccessBlock __nonnull)successBlock failureBlock:(SONFailureBlock __nonnull)failureBlock;

@end
