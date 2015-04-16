//
//  ItemDetailViewController
//  CheckLists
//
//  Created by wangx on 15/3/31.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckListItem.h"

@class ItemDetailViewController;
@class ChecklistItem;

@protocol ItemDetailViewControllerDelegate <NSObject>
    -(void)ItemDetailViewControllerDidCancel:(ItemDetailViewController *)controller;
    -(void)ItemDetailViewController:(ItemDetailViewController *)controller
    didFinishAddingItem:(CheckListItem *)item;
    -(void)ItemDetailViewController:(ItemDetailViewController *) controller
    didFinishEditingItem:(CheckListItem *)item;

@end


@interface ItemDetailViewController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

@property (nonatomic,strong) CheckListItem *itemToEdit;

@property (nonatomic,weak) id<ItemDetailViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;

- (IBAction)done:(id)sender;


@end
