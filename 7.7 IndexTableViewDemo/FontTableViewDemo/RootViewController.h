//
//  RootViewController.h
//  FontTableViewDemo
//
//  Created by wangx on 15/5/30.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
@private
    UITableView *_tableView;
    NSDictionary *_dataDic;
    NSArray *_keyArray;
}


@end
