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
    [self.textField becomeFirstResponder];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    if(self.itemToEdit!=nil){
        self.title=@"Edit Item";
        self.textField.text=self.itemToEdit.text;
        self.doneBarButton.enabled=YES;
    }
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}


-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newText=[textField.text stringByReplacingCharactersInRange:range withString:string];
    if ([newText length]>0) {
        self.doneBarButton.enabled=YES;
    }else{
        self.doneBarButton.enabled=NO;
    }
    return YES;
}


- (IBAction)cancel:(id)sender {
    [self.delegate ItemDetailViewControllerDidCancel:self];
}

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
