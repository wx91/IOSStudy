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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *iconName=_icons[indexPath.row];
    [self.delegate iconPick:self didPickIcon:iconName];
}

@end
