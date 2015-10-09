//
//  DetailViewController.h
//  8.1CustomCellDemo
//
//  Created by wangx on 15/6/20.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController{
@private
    NSArray *_listArray;
}

@property(nonatomic,assign)NSInteger cellType;


@end
