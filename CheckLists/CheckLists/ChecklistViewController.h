//
//  ViewController.h
//  CheckLists
//
//  Created by wangx on 15/3/29.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"
@class Checklist;

@interface ChecklistViewController : UITableViewController<ItemDetailViewControllerDelegate>

@property(nonatomic,strong)Checklist *checklist;

@end

