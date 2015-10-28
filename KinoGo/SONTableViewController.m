//
//  SONTableViewController.m
//  KinoGo
//
//  Created by Ronan on 28/10/2015.
//  Copyright © 2015 Sonomos Software S.L. All rights reserved.
//

#import "SONTableViewController.h"
#import "SONDefines.h"

const float sectionHeight = 150;

@interface SONTableViewController ()

@end

@implementation SONTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BACKGROUND_COLOR;
    [self.navigationController.navigationBar setBarTintColor:NAVIGATION_BAR_COLOR];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSONCellIdentifier];
    self.tableView.rowHeight = sectionHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSONCellIdentifier forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return nil;
            break;
        case 1:
            return @"Currently running";
        case 2:
            return @"Upcomming";
            
        default:
            return nil;
    }
}


//- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *aView = [[UIView alloc] init];
//    return aView;
//}
//


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
