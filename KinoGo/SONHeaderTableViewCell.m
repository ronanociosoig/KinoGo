//
//  SONHeaderTableViewCell.m
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import "SONHeaderTableViewCell.h"
#import "SONDefines.h"
#import "SONHeaderCollectionViewCell.h"

@implementation SONHeaderTableViewCell

- (void)awakeFromNib {
    // Initialization code
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    self.collectionView.backgroundColor = BACKGROUND_COLOR;
    UINib *headerNib = [UINib nibWithNibName:@"SONHeaderCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:headerNib forCellWithReuseIdentifier:kSONHeaderCollectionCellIdentifier];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // kSONHeaderCollectionCellIdentifier
    
    SONHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSONHeaderCollectionCellIdentifier forIndexPath:indexPath];
    
    return cell;
}

@end
