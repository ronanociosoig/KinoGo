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
#import "SONAppController.h"
#import "SONAppData.h"
#import "Haneke.h"
#import "SONMovie.h"

@implementation SONHeaderTableViewCell

- (void)awakeFromNib {
    // Initialization code
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    self.collectionView.backgroundColor = BACKGROUND_COLOR;
    UINib *headerNib = [UINib nibWithNibName:@"SONHeaderCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:headerNib forCellWithReuseIdentifier:kSONHeaderCollectionCellIdentifier];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    if (!self.appController) {
        self.appController = [SONAppController sharedAppController];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chartsDataReadyNotificationHandler:) name: kSONChartsDataReadyNotification object:nil];
        
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
    if (self.appController.appData.chartsMovies && [self.appController.appData.chartsMovies count] > 0) {
        return [self.appController.appData.chartsMovies count];
    }
    return 1;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SONHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSONHeaderCollectionCellIdentifier forIndexPath:indexPath];
    
    SONLog(@"Movies count: %d",(int)[self.appController.appData.chartsMovies count]);
    
    if (indexPath.row < [self.appController.appData.chartsMovies count]) {
        SONMovie *movie = self.appController.appData.chartsMovies[indexPath.row];
        
        NSURL *url = [NSURL URLWithString:movie.trailerPosterImageURLString];
        [cell.imageView hnk_setImageFromURL:url];
        cell.titleLabel.text = movie.title;
    }
    
    return cell;
}

- (void)chartsDataReadyNotificationHandler: (NSNotification*) notification {
    DISPATCH_ON_MAIN(^{
        [self.collectionView reloadData];
    });
}

@end
