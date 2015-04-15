//
//  ListDetailViewControllerTableViewController.m
//  CheckLists
//
//  Created by wangx on 15/4/12.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ListDetailViewController.h"
#import "Checklist.h"

@interface ListDetailViewController ()

@end

@implementation ListDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.checklistToEdit!=nil) {
        self.title=@"Edit Checklist";
        self.textField.text=self.checklistToEdit.name;
        self.doneBarButton.enabled=YES;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
}


-(IBAction)cancel:(id)sender{
    [self.delegate listDetailViewControllerDidCancel:self];
}
-(IBAction)done:(id)sender{
    if (self.checklistToEdit==nil) {
        Checklist *checklist=[[Checklist alloc]init];
        checklist.name=self.textField.text;
        [self.delegate listDetailViewController:self didFinishAddingChecklist:checklist];
    }else{
        self.checklistToEdit.name=self.textField.text;
        [self.delegate listDetailViewController:self didFinishEditingChecklist:self.checklistToEdit];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newText=[textField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled=([newText length]>0);
    return YES;
}
@end
