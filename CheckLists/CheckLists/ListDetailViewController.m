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

@interface ListDetailViewController ()

@end

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

-(IBAction)cancel:(id)sender{
    [self.delegate listDetailViewControllerDidCancel:self];
}
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

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        return indexPath;
    }else{
        return nil;
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newText=[textField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled=([newText length]>0);
    return YES;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"PickIcon"]) {
        IconPickerViewController *controller=segue.destinationViewController;
        controller.delegate=self;
    }
}
-(void)iconPick:(IconPickerViewController *)picker didPickIcon:(NSString *)iconName{
    _iconName=iconName;
    self.iconImageView.image=[UIImage imageNamed:_iconName];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
