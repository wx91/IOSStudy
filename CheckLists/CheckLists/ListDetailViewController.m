//
//  ListDetailViewControllerTableViewController.m
//  CheckLists
//
//  Created by wangx on 15/4/12.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ListDetailViewController.h"
#import "Checklist.h"
#import "IconPickerViewController.h"

@implementation ListDetailViewController{
    NSString *_iconName;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.checklistToEdit!=nil) {
        self.title=@"Edit Checklist";
        self.textField.text=self.checklistToEdit.name;
        self.doneBarButton.enabled=YES;
        _iconName=self.checklistToEdit.iconName;
    }else{
        self.iconImageView.image=[UIImage imageNamed:_iconName];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
        _iconName=@"Folder";
    }
    return self;
}
#pragma mark segue链接的统一配置中心
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"PickIcon"]) {
        IconPickerViewController *controller=segue.destinationViewController;
        controller.delegate=self;
    }
}

#pragma mark 点击选择中触发事件
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==1) {
        return indexPath;
    }else{
        return nil;
    }
}

#pragma mark 增加对textField填写的内容进行验证
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newText=[textField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled=([newText length]>0);
    return YES;
}

#pragma mark 点击取消按钮触发事件
-(IBAction)cancel:(id)sender{
    [self.delegate listDetailViewControllerDidCancel:self];
}

#pragma mark 点击done按钮触发事件
-(IBAction)done:(id)sender{
    if (self.checklistToEdit==nil) {
        Checklist *checklist=[[Checklist alloc]init];
        checklist.name=self.textField.text;
        checklist.iconName=_iconName;
        [self.delegate listDetailViewController:self didFinishAddingChecklist:checklist];
    }else{
        self.checklistToEdit.name=self.textField.text;
        self.checklistToEdit.iconName=_iconName;
        [self.delegate listDetailViewController:self didFinishEditingChecklist:self.checklistToEdit];
    }
}
#pragma mark 实现IconPickViewControllerDelegate为为委托的didPickIcon方法
-(void)iconPick:(IconPickerViewController *)picker didPickIcon:(NSString *)iconName{
    _iconName=iconName;
    self.iconImageView.image=[UIImage imageNamed:_iconName];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
