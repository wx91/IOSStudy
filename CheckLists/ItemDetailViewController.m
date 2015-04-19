//
//  ItemDetailViewController.m
//  CheckLists
//
//  Created by wangx on 15/3/31.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ChecklistItem.h"

@implementation ItemDetailViewController{
    NSDate *_dueDate;
    BOOL _datePickVisible;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //设置该textField为第一响应事件
    [self.textField becomeFirstResponder];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    //如果传入的item不为空
    if(self.itemToEdit!=nil){
        //设置导航栏的标题为Edit Item
        self.title=@"Edit Item";
        //设置页面的textField为item的text
        self.textField.text=self.itemToEdit.text;
        //把done按钮设置为可用
        self.doneBarButton.enabled=YES;
        self.switchControl.on=self.itemToEdit.shouldRemind;
        _dueDate=self.itemToEdit.dueDate;
    }else{
        self.switchControl.on=NO;
        _dueDate=[NSDate date];
    }
    [self updateDueDateLabel];
}
#pragma mark 为表视图单位格提供数据，该方法是必须实现的方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1&&indexPath.row==2) {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"DatePickerCell"];
        if(cell==nil){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DatePickerCell"];
            UIDatePicker *datePicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 216.0f)];
            datePicker.tag=100;
            [cell.contentView addSubview:datePicker];
            [datePicker addTarget:self action:@selector(dateChanged) forControlEvents:UIControlEventValueChanged];
        }
        return cell;
    }else{
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }
}
#pragma mark 返回某一个节中的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==1&&_datePickVisible){
        return 3;
    }else{
        return [super tableView:tableView numberOfRowsInSection:section];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==1&&indexPath.row==2){
        return 217.0f;
    }else{
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
}
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==1&&indexPath.row==1){
        return  indexPath;
    }else{
        return nil;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.textField resignFirstResponder];
    if(indexPath.section==1&&indexPath.row==1){
        if (!_datePickVisible) {
            [self showDatePick];
        }else{
            [self hideDatePicker];
        }
    }
}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==1&&indexPath.row==2){
        NSIndexPath *newIndexPath=[NSIndexPath indexPathForRow:0 inSection:indexPath.section];
        return [super tableView:tableView indentationLevelForRowAtIndexPath:newIndexPath];
    }else{
        return [super tableView:tableView indentationLevelForRowAtIndexPath:indexPath];
    }
}


/**
 *  @author wangx, 15-04-18 15:04:43
 *
 *  显示日期选择框
 */
-(void)showDatePick{
    _datePickVisible=YES;
    NSIndexPath *indexPathDateRow=[NSIndexPath indexPathForRow:1 inSection:1];
    NSIndexPath *indexPathDatePick =[NSIndexPath indexPathForRow:2 inSection:1];
    UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:indexPathDateRow];
    cell.detailTextLabel.textColor=cell.detailTextLabel.tintColor;
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[indexPathDatePick] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView reloadRowsAtIndexPaths:@[indexPathDateRow] withRowAnimation:UITableViewRowAnimationNone];
    UITableViewCell *datePickerCell=[self.tableView cellForRowAtIndexPath:indexPathDatePick];
    UIDatePicker *datePicker=(UIDatePicker *)[datePickerCell viewWithTag:100];
    [datePicker setDate:_dueDate animated:NO];
}
/**
 *  @author wangx, 15-04-18 15:04:57
 *
 *  隐藏日期选择框
 */
-(void)hideDatePicker{
    if (_datePickVisible) {
        _datePickVisible=NO;
        NSIndexPath *indexPathDateRow=[NSIndexPath indexPathForRow:1 inSection:1];
        NSIndexPath *indexPathDatePick =[NSIndexPath indexPathForRow:2 inSection:1];
        UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:indexPathDateRow];
        cell.detailTextLabel.textColor=[UIColor colorWithWhite:0.0f alpha:0.5f];
        [self.tableView beginUpdates];
        [self.tableView reloadRowsAtIndexPaths:@[indexPathDateRow] withRowAnimation:UITableViewRowAnimationNone];
        [self.tableView deleteRowsAtIndexPaths:@[indexPathDatePick] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
    }
}
/**
 *  @author wangx, 15-04-18 15:04:12
 *
 *  选择日期变更后触发事件
 *
 *  @param datePicker 日期选择框
 */
-(void)dateChanged:(UIDatePicker *)datePicker{
    _dueDate=datePicker.date;
    [self updateDueDateLabel];
}
/**
 *  @author wangx, 15-04-18 15:04:11
 *
 *  更新日期选择label中的值
 */
-(void)updateDueDateLabel{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    self.dueDateLabel.text=[formatter stringFromDate:_dueDate];
}
/**
 *  @author wangx, 15-04-18 15:04:35
 *
 *  当描述完成时
 *
 *  @param textField 代办事项的描述
 */
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self hideDatePicker];
}

#pragma mark对textField的填充文字验证
-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newText=[textField.text stringByReplacingCharactersInRange:range withString:string];
    if ([newText length]>0) {
        self.doneBarButton.enabled=YES;
    }else{
        self.doneBarButton.enabled=NO;
    }
    return YES;
}
#pragma mark点击取消按钮后触发的方法
- (IBAction)cancel:(id)sender {
    [self.delegate ItemDetailViewControllerDidCancel:self];
}
#pragma mark点击done按钮后触发的方法
- (IBAction)done:(id)sender {
    if (self.itemToEdit==nil) {
        ChecklistItem *item=[[ChecklistItem alloc]init];
        item.text=self.textField.text;
        item.checked=NO;
        item.shouldRemind=self.switchControl.on;
        item.dueDate=_dueDate;
        [self.delegate ItemDetailViewController:self didFinishAddingItem:item];
    }else{
        self.itemToEdit.text=self.textField.text;
        self.itemToEdit.shouldRemind=self.switchControl.on;
        self.itemToEdit.dueDate=_dueDate;
        [self.delegate ItemDetailViewController:self didFinishEditingItem:self.itemToEdit];
    }
}
@end
