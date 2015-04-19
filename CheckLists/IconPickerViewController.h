//
//  IconPickerViewControllerTableViewController.h
//  CheckLists
//
//  Created by wangx on 15/4/14.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IconPickerViewController;

@protocol IconPickViewControllerDelegate <NSObject>

-(void)iconPick:(IconPickerViewController *)picker didPickIcon:(NSString *)iconName;

@end

@interface IconPickerViewController : UITableViewController

@property(nonatomic,weak) id <IconPickViewControllerDelegate>delegate;

@end
