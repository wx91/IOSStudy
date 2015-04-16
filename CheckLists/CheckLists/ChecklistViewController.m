//
//  ViewController.m
//  CheckLists
//
//  Created by wangx on 15/3/29.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ChecklistViewController.h"
#import "CheckListItem.h"
#import "ItemDetailViewController.h"
#import "Checklist.h"

@interface ChecklistViewController (){
    
}

@end

@implementation ChecklistViewController{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=self.checklist.name;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.checklist.items count];
}

-(void)configureCheckmarkForCell:(UITableViewCell *)cell withCheckListItem:(CheckListItem *)item{
    UILabel *label =(UILabel *)[cell viewWithTag:1001];
    if(item.checked){
       label.text=@"√";
    }else{
        label.text=@"";
    }
}

-(void)configureTextForCell:(UITableViewCell *)cell withCheckListItem:(CheckListItem *)item{
     UILabel *label =(UILabel *)[cell viewWithTag:1000];
    label.text=item.text;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CheckListItem"];
    CheckListItem *item =self.checklist.items[indexPath.row];
    [self configureCheckmarkForCell:cell withCheckListItem:item];
    [self configureTextForCell:cell withCheckListItem:item];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    CheckListItem *item=self.checklist.items[indexPath.row];
    [item toggleChecked];
    [self configureCheckmarkForCell:cell withCheckListItem:item];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.checklist.items removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths=@[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}
-(void)ItemDetailViewController:(id)controller didFinishAddingItem:(id)item{
    NSInteger newRowIndex=[self.checklist.items count];
    [self.checklist.items addObject:item];
    NSIndexPath *indePath=[NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths=@[indePath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)ItemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(CheckListItem *)item{
    NSInteger index=[self.checklist.items indexOfObject:item];
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:indexPath];
    [self configureTextForCell:cell withCheckListItem:item];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)ItemDetailViewControllerDidCancel:(id)controller{
      [self dismissViewControllerAnimated:YES completion:nil];
}

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
 