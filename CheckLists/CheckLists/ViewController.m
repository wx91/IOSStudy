//
//  ViewController.m
//  CheckLists
//
//  Created by wangx on 15/3/29.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ViewController.h"
#import "CheckListItem.h"
#import "ItemDetailViewController.h"
@interface ViewController (){
    
}

@end

@implementation ViewController{
    NSMutableArray *_items;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self loadCheckListItems];
    }
    return self;
}
-(void)loadCheckListItems{
    NSString *path=[self dataFilePath];
    if ([[NSFileManager defaultManager]fileExistsAtPath:path]) {
        NSData *data=[[NSData alloc]initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        _items=[unarchiver decodeObjectForKey:@"CheckListItems"];
        [unarchiver finishDecoding];
    }else{
        _items =[[NSMutableArray alloc]initWithCapacity:20];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"文件目录%@",[self dataFilePath]);
}
-(NSString *)doucmentsDirectoy{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory=[paths firstObject];
    return  documentsDirectory;
}
-(NSString *)dataFilePath{
    return [[self doucmentsDirectoy]stringByAppendingPathComponent:@"Checklists.plist"];
}
-(void) saveCheckListItems{
    NSMutableData *data=[[NSMutableData alloc]init];
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:_items forKey:@"CheckListItems"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_items count];
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
    CheckListItem *item =_items[indexPath.row];
    [self configureCheckmarkForCell:cell withCheckListItem:item];
    [self configureTextForCell:cell withCheckListItem:item];
    return cell;
}
//运行应用，然后触碰某一行，你会看到该行的背景快速变灰，然后再次恢复之前的状态
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    CheckListItem *item=_items[indexPath.row];
    [item toggleChecked];
    [self configureCheckmarkForCell:cell withCheckListItem:item];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [_items removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths=@[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}
-(void)ItemDetailViewController:(id)controller didFinishAddingItem:(id)item{
    NSInteger newRowIndex=[_items count];
    [_items addObject:item];
    NSIndexPath *indePath=[NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths=@[indePath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)ItemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(CheckListItem *)item{
    NSInteger index=[_items indexOfObject:item];
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
        controller.itemToEdit=_items[indexPath.row];
        
    }
}


@end
 