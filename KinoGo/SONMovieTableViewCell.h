//
//  SONMovieTableViewCell.h
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SONAppController;

@interface SONMovieTableViewCell : UITableViewCell <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic, nonnull) SONAppController *appController;
@property (strong, nonatomic, nonnull) NSString *notificationProperty;

@property (assign, nonatomic) NSInteger selectedIndex;

- (void) configureNotification:(NSString* __nonnull)notification;

@end
