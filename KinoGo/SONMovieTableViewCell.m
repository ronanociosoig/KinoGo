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
#import "SONAppController.h"
#import "SONAppData.h"

@implementation SONMovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    self.collectionView.backgroundColor = BACKGROUND_COLOR;
    UINib *headerNib = [UINib nibWithNibName:@"SONCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:headerNib forCellWithReuseIdentifier:kSONMovieCollectionCellIdentifier];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UICollectionView Datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SONCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSONMovieCollectionCellIdentifier forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"MoviePlaceholderImage"];
    cell.titleLabel.text = @"Inter";
    cell.titleLabel.textColor = [UIColor lightGrayColor];
    cell.subtitleLabel.text = @"Subtitle";
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    MJLog(@"");
//    VINCallCollectionViewCell *cell = (VINCallCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
//    [[NSNotificationCenter defaultCenter] postNotificationName:kOUTGOING_CALL_NOTIFICATION object:cell.objectId];
}

@end
