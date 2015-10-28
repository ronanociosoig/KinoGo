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
#import "Haneke.h"
#import "SONMovie.h"

@implementation SONMovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    self.collectionView.backgroundColor = BACKGROUND_COLOR;
    UINib *headerNib = [UINib nibWithNibName:@"SONCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:headerNib forCellWithReuseIdentifier:kSONMovieCollectionCellIdentifier];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    if (!self.appController) {
        self.appController = [SONAppController sharedAppController];
    }
    
    if (self.notificationProperty) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name: self.notificationProperty object:nil];
    }
    
    self.selectedIndex = -1;
}

- (void) configureNotification:(NSString* __nonnull)notification {
    self.notificationProperty = notification;
    if (self.notificationProperty) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name: self.notificationProperty object:nil];
    }
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
    SONLog(@"");
    return [[self dataSourceArray] count];
}

- (NSArray*)dataSourceArray {
    if ([self.notificationProperty isEqualToString:kSONRunningDataReadyNotification]) {
        return self.appController.appData.runningMovies;
    } else {
        return self.appController.appData.upcomingMovies;
    }
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SONCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSONMovieCollectionCellIdentifier forIndexPath:indexPath];
    
    SONLog(@"Movies count: %d",(int)[self dataSourceArray]);
    
    if (indexPath.row < [[self dataSourceArray]  count]) {
        SONMovie *movie = [self dataSourceArray][indexPath.row];
        
        NSURL *url = [NSURL URLWithString:movie.frontPosterImageURLString];
        [cell.imageView hnk_setImageFromURL:url];
        cell.titleLabel.text = movie.title;
    }
    
//    cell.imageView.image = [UIImage imageNamed:@"MoviePlaceholderImage"];
//    cell.titleLabel.text = @"Inter";
//    cell.titleLabel.textColor = [UIColor lightGrayColor];
//    cell.subtitleLabel.text = @"Subtitle";

    if (indexPath.row == self.selectedIndex) {
        cell.layer.borderColor = NAVIGATION_BAR_COLOR.CGColor;
        cell.layer.borderWidth = 2;
    } else {
        cell.layer.borderWidth = 0;
    }
    
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
    SONCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSONMovieCollectionCellIdentifier forIndexPath:indexPath];
    self.selectedIndex = indexPath.row;
    cell.layer.borderColor = NAVIGATION_BAR_COLOR.CGColor;
    cell.layer.borderWidth = 2;
}

#pragma mark - NSNotification handler

- (void)notificationHandler:(NSNotification*)notification {
    DISPATCH_ON_MAIN(^{
        [self.collectionView reloadData];
    });
}

@end
