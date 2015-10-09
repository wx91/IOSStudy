//
//  RootViewController.m
//  8.2EditeTableViewDemo
//
//  Created by wangx on 15/6/21.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fontsArray=[NSMutableArray arrayWithArray:[UIFont familyNames]];
    self.navigationItem.rightBarButtonItem=self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_fontsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 320, 44)];
        label.tag=101;
        [cell.contentView addSubview:label];
    }
    UILabel *label=(UILabel *)[cell.contentView viewWithTag:101];
    label.text=_fontsArray[indexPath.row];
    return cell;
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    if (self.tableView.editing) {
        [self.tableView setEditing:NO animated:YES];
    }else{
        [self.tableView setEditing:YES animated:YES];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        return NO;
    }
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return UITableViewCellEditingStyleNone;
    }else if(indexPath.row==1){
        return UITableViewCellEditingStyleInsert;
    }else{
        return UITableViewCellEditingStyleDelete;
    }
}

static int count=1;
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_fontsArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        NSString *newFont=[[NSString alloc]initWithFormat:@"New Font %d",count];
        [_fontsArray insertObject:newFont atIndex:indexPath.row+1];
        NSIndexPath *_indexPath=[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
        [self.tableView insertRowsAtIndexPaths:@[_indexPath] withRowAnimation:UITableViewRowAnimationFade];
        count++;
    }   
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NSString *text=[_fontsArray objectAtIndex:fromIndexPath.row];
    [_fontsArray removeObject:text];
    [_fontsArray insertObject:text atIndex:toIndexPath.row];
    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
