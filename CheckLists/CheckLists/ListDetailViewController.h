//
//  ListDetailViewControllerTableViewController.h
//  CheckLists
//
//  Created by wangx on 15/4/12.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IconPickerViewController.h"

@class ListDetailViewController;
@class Checklist;

@protocol ListDetailViewControllerDelegate <NSObject>
-(void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller;
-(void)listDetailViewController:(ListDetailViewController *)controller
       didFinishAddingChecklist:(Checklist *)checklist;
-(void)listDetailViewController:(ListDetailViewController *) controller
           didFinishEditingChecklist:(Checklist *)checklist;
@end


@interface ListDetailViewController : UITableViewController<UITextFieldDelegate,IconPickViewControllerDelegate>

@property(nonatomic,weak)IBOutlet UIBarButtonItem *doneBarButton;

@property(nonatomic,weak)IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property(nonatomic,strong)Checklist *checklistToEdit;

@property(nonatomic,weak)id<ListDetailViewControllerDelegate> delegate;


-(IBAction)cancel:(id)sender;

-(IBAction)done:(id)sender;


@end
