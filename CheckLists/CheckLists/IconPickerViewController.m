//
//  IconPickerViewControllerTableViewController.m
//  CheckLists
//
//  Created by wangx on 15/4/14.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "IconPickerViewController.h"

@interface IconPickerViewController (){
    NSArray *_icons;
}

@end

@implementation IconPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _icons = @[@"No Icon", @"Appointments", @"Birthdays", @"Chores", @"Drinks", @"Folder", @"Groceries", @"Inbox", @"Photos", @"Trips"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_icons count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"IconCell"];
    NSString *icon=_icons[indexPath.row];
    cell.textLabel.text=icon;
    cell.imageView.image=[UIImage imageNamed:icon];
    return cell;
}



@end
