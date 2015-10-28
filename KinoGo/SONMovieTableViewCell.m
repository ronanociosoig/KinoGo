//
//  SONMovieTableViewCell.m
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import "SONMovieTableViewCell.h"
#import "SONDefines.h"
#import "SONCollectionViewCell.h"

@implementation SONMovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    self.collectionView.backgroundColor = BACKGROUND_COLOR;
    UINib *headerNib = [UINib nibWithNibName:@"SONCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:headerNib forCellWithReuseIdentifier:kSONMovieCollectionCellIdentifier];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SONCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSONMovieCollectionCellIdentifier forIndexPath:indexPath];
    
    return cell;
}

@end
