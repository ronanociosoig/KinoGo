//
//  SONTableViewController.m
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import "SONTableViewController.h"
#import "SONDefines.h"
#import "SONHeaderTableViewCell.h"
#import "SONMovieTableViewCell.h"
#import "SONAppController.h"

const float sectionHeight = 160;
const NSInteger kHeaderSection = 0;
const NSInteger kRunningSection = 1;
const NSInteger kUpcomingSection = 2;

// Section header
const CGFloat margin = 10.0;
const CGFloat labelHeight = 24.0;


@interface SONTableViewController ()
{
    SONAppController *appController;
}

@end

@implementation SONTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BACKGROUND_COLOR;
    [self.navigationController.navigationBar setBarTintColor:NAVIGATION_BAR_COLOR];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    UINib *headerNib = [UINib nibWithNibName:@"SONHeaderTableViewCell" bundle:nil];
    UINib *movieNib = [UINib nibWithNibName:@"SONMovieTableViewCell" bundle:nil];
    
    [self.tableView registerNib:headerNib forCellReuseIdentifier:kSONHeaderCellIdentifier];
    [self.tableView registerNib:movieNib forCellReuseIdentifier:kSONMovieCellIdentifier];
    
    self.tableView.rowHeight = sectionHeight;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    
    appController = [SONAppController sharedAppController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [appController loadCharts];
    [appController loadRunning];
    [appController loadUpcoming];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case kHeaderSection:
            return 180.0;
            
        default:
            return 260.0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case kHeaderSection:
        {
            SONHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSONHeaderCellIdentifier forIndexPath:indexPath];
            cell.backgroundColor = BACKGROUND_COLOR;
            return cell;
        }
            
            break;
            case kRunningSection:
        {
            SONMovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSONMovieCellIdentifier forIndexPath:indexPath];
            //cell.notificationProperty = kSONRunningDataReadyNotification;
            [cell configureNotification:kSONRunningDataReadyNotification];
            cell.backgroundColor = BACKGROUND_COLOR;
            return cell;
        }
            break;
        case kUpcomingSection:
        {
            SONMovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSONMovieCellIdentifier forIndexPath:indexPath];
            //cell.notificationProperty = kSONUpcomingDataReadyNotification;
            [cell configureNotification:kSONUpcomingDataReadyNotification];
            cell.backgroundColor = BACKGROUND_COLOR;
            return cell;
        }
            break;
        default:
            return nil;
            break;
    }
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 1:
            return @"Currently running";
        case 2:
            return @"Upcomming";
        case 0:
        default:
            return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == kHeaderSection) {
        return 0;
    }
    
    return 30.0;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *aView = [[UIView alloc] init];
    aView.backgroundColor = [UIColor clearColor];
    UILabel *aLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, 0.0, self.tableView.frame.size.width - (2 * margin), labelHeight)];
    
    switch (section) {
        case 1:
            aLabel.text = @"Currently running";
            break;
        case 2:
            aLabel.text = @"Upcomming";
            break;
        case 0:
        default:
            aLabel.text = @"";
    }

    aLabel.textColor = [UIColor whiteColor];
    [aView addSubview:aLabel];
    return aView;
}

@end
