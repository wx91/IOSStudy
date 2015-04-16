//
//  ViewController.m
//  CheckLists
//
//  Created by wangx on 15/3/29.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//
#import "Checklist.h"
#import "CheckListItem.h"
#import "ChecklistViewController.h"
#import "ItemDetailViewController.h"

@implementation ChecklistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏的标题为checklist的name
    self.title=self.checklist.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark 设置table的数据源返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.checklist.items count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取可用的cell根据名称得到CheckListItem
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CheckListItem"];
    CheckListItem *item =self.checklist.items[indexPath.row];
    [self configureCheckmarkForCell:cell withCheckListItem:item];
    [self configureTextForCell:cell withCheckListItem:item];
    return cell;
}
#pragma mark tableview的某行点击后的事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    CheckListItem *item=self.checklist.items[indexPath.row];
    //对点击的这一行的选中状态进行切换
    [item toggleChecked];
    [self configureCheckmarkForCell:cell withCheckListItem:item];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark 根据传入的CheckListItem的对象的text，来设置textField的显示值
-(void)configureTextForCell:(UITableViewCell *)cell withCheckListItem:(CheckListItem *)item{
    UILabel *label =(UILabel *)[cell viewWithTag:1000];
    label.text=item.text;
}
#pragma mark 点击某行的选中状态，调整是否勾选
-(void)configureCheckmarkForCell:(UITableViewCell *)cell withCheckListItem:(CheckListItem *)item{
    UILabel *label =(UILabel *)[cell viewWithTag:1001];
    if(item.checked){
       label.text=@"√";
    }else{
        label.text=@"";
    }
}
#pragma mark 对选中的行进行删除的动画方法
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.checklist.items removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths=@[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}
#pragma mark 实现ItemDetailViewControllerDelegate的代理方法ItemDetailViewControllerDidCancel
-(void)ItemDetailViewControllerDidCancel:(id)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark 实现ItemDetailViewControllerDelegate的代理方法didFinishAddingItem
-(void)ItemDetailViewController:(id)controller didFinishAddingItem:(id)item{
    NSInteger newRowIndex=[self.checklist.items count];
    [self.checklist.items addObject:item];
    NSIndexPath *indePath=[NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths=@[indePath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark 实现ItemDetailViewControllerDelegate的代理方法didFinishEditingItem
-(void)ItemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(CheckListItem *)item{
    NSInteger index=[self.checklist.items indexOfObject:item];
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:indexPath];
    [self configureTextForCell:cell withCheckListItem:item];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 设置segue即为页面的跳转
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"AddItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ItemDetailViewController *controller = (ItemDetailViewController*) navigationController.topViewController;
        controller.delegate = self;
    }else if([segue.identifier isEqualToString:@"EditItem"]){
        UINavigationController *navigationController=segue.destinationViewController;
        ItemDetailViewController *controller =(ItemDetailViewController *)navigationController.topViewController;
        controller.delegate =self;
        NSIndexPath *indexPath=[self.tableView indexPathForCell:sender];
        controller.itemToEdit=self.checklist.items[indexPath.row];
    }
}
@end
 