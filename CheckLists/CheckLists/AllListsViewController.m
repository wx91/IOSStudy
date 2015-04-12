//
//  AllListsViewController.m
//  CheckLists
//
//  Created by wangx on 15/4/12.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "AllListsViewController.h"
#import "Checklist.h"
#import "ChecklistViewController.h"

@interface AllListsViewController (){
    NSMutableArray *_lists;
}

@end

@implementation AllListsViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _lists=[[NSMutableArray alloc]initWithCapacity:20];
        Checklist *list;
        
        list=[[Checklist alloc]init];
        list.name=@"娱乐";
        [_lists addObject:list];
        
        list=[[Checklist alloc]init];
        list.name=@"工作";
        [_lists addObject:list];
        
        list=[[Checklist alloc]init];
        list.name=@"学习";
        [_lists addObject:list];
        
        list=[[Checklist alloc]init];
        list.name=@"家庭";
        [_lists addObject:list];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_lists count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Checklist *checklist=_lists[indexPath.row];
    cell.textLabel.text=checklist.name;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Checklist *checklist=_lists[indexPath.row];
    [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ShowChecklist"]) {
        ChecklistViewController *controller=segue.destinationViewController;
        controller.checklist=sender;
    }else if ([segue.identifier isEqualToString:@"AddChecklist"]){
        UINavigationController *navigationController=segue.destinationViewController;
        ListDetailViewController *controller=(ListDetailViewController *)navigationController.topViewController;
        controller.delegate=self;
        controller.checklistToEdit=nil;
    }
}
-(void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingItem:(Checklist *)checklist{
    NSInteger newRowIndex=[_lists count];
    [_lists addObject:checklist];
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths=@[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingItem:(Checklist *)checklist{
    NSInteger index=[_lists indexOfObject:checklist];
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.text=checklist.name;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [_lists removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths=@[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}











@end
