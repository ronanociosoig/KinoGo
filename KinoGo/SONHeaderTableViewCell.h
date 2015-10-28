//
//  SONHeaderTableViewCell.h
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SONAppController;

@interface SONHeaderTableViewCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic, nonnull) SONAppController *appController;

@end
