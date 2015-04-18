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
#import "DataModel.h"

@implementation AllListsViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate=self;
    NSInteger index=[self.dataModel indexOfSelectedChecklist];
    if (index>=0&&index<[self.dataModel.lists count]) {
        Checklist *checklist=self.dataModel.lists[index];
        [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark 设置sugue的跳转流程
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

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(viewController==self){
        [self.dataModel setIndexOfSelectedChecklist:-1];
    }
}
#pragma mark 设置tableview的数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataModel.lists count];
}

#pragma mark实现tableview自带的设置表格cell的方法 
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    Checklist *checklist=self.dataModel.lists [indexPath.row];
    cell.textLabel.text=checklist.name;
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    int count=[checklist countUncheckedItems];
    if ([checklist.items count]==0) {
        cell.detailTextLabel.text=@"(No Items)";
    }else if (count==0) {
        cell.detailTextLabel.text=@"全部搞定收工";
    }else{
        cell.detailTextLabel.text=[NSString stringWithFormat:@"%d Remaining",count];
    }
    cell.imageView.image=[UIImage imageNamed:checklist.iconName];
    return  cell;
}

#pragma mark实现tableview点击选中后的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.dataModel setIndexOfSelectedChecklist:indexPath.row];
    Checklist *checklist=self.dataModel.lists [indexPath.row];
    [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
}

#pragma mark实现tableview自带的删除方法
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.dataModel.lists  removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths=@[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}
#pragma mark实现ListDetailViewControllerDelegate的listDetailViewControllerDidCancel方法
-(void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark实现ListDetailViewControllerDelegate的didFinishAddingChecklist方法
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist{
    [self.dataModel.lists addObject:checklist];
    [self.dataModel sortChecklists];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark实现ListDetailViewControllerDelegate的didFinishEditingChecklist方法
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist{
    [self.dataModel sortChecklists];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
