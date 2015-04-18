//
//  AllListsViewController.h
//  CheckLists
//
//  Created by wangx on 15/4/12.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "Checklist.h"
#import "ListDetailViewController.h"



@interface AllListsViewController : UITableViewController<ListDetailViewControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong)DataModel *dataModel;

@end
