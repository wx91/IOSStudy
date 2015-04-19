//
//  ItemDetailViewController
//  CheckLists
//
//  Created by wangx on 15/3/31.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChecklistItem.h"

@class ItemDetailViewController;
@class ChecklistItem;

@protocol ItemDetailViewControllerDelegate <NSObject>
    -(void)ItemDetailViewControllerDidCancel:(ItemDetailViewController *)controller;
    -(void)ItemDetailViewController:(ItemDetailViewController *)controller
    didFinishAddingItem:(ChecklistItem *)item;
    -(void)ItemDetailViewController:(ItemDetailViewController *) controller
    didFinishEditingItem:(ChecklistItem *)item;

@end

@interface ItemDetailViewController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UISwitch *switchControl;

@property (weak, nonatomic) IBOutlet UILabel *dueDateLabel;

@property (nonatomic,strong) ChecklistItem *itemToEdit;

@property (nonatomic,weak) id<ItemDetailViewControllerDelegate> delegate;

-(void)dateChanged:(UIDatePicker *)datePicker;

- (IBAction)cancel:(id)sender;

- (IBAction)done:(id)sender;


@end
