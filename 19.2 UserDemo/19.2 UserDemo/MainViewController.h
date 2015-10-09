//
//  MainViewController.h
//  19.2 UserDemo
//
//  Created by wangx on 15/7/7.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)NSArray* data;

@property(nonatomic,retain)UITableView *tableView;

@end
