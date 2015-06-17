//
//  DetailViewController.h
//  FontTableViewDemo
//
//  Created by wangx on 15/5/31.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
@private
UITableView *_tableView;
NSMutableArray  *_fontsArray;
}
@property(nonatomic,assign) BOOL isPlan;

@end
