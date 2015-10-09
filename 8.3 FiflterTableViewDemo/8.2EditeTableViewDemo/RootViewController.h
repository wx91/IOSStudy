//
//  RootViewController.h
//  8.2EditeTableViewDemo
//
//  Created by wangx on 15/6/21.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController<UITextFieldDelegate>{
@private
    NSMutableArray *_fontsArray;
    NSArray *_data;
}
@property(nonatomic,retain)NSArray *fontsArray;

@end
