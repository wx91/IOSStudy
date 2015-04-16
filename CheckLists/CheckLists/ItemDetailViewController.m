//
//  ItemDetailViewController.m
//  CheckLists
//
//  Created by wangx on 15/3/31.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "CheckListItem.h"

@implementation ItemDetailViewController

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
    }
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
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
        CheckListItem *item=[[CheckListItem alloc]init];
        item.text=self.textField.text;
        item.checked=NO;
        [self.delegate ItemDetailViewController:self didFinishAddingItem:item];
    }else{
        self.itemToEdit.text=self.textField.text;
        [self.delegate ItemDetailViewController:self didFinishEditingItem:self.itemToEdit];
    }
}
@end
