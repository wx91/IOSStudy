//
//  DetailViewController.h
//  2.4 AnimationDemo
//
//  Created by wangx on 15/6/21.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController{
    @private
    UIView *parentView;
    UIView *view1;
    UIView *view2;
    NSInteger _row;
    NSInteger _seciton;
    UILabel *label;
    UIButton *button;
    NSString *_detailTitle;
}

@property(nonatomic) NSInteger row;
@property(nonatomic) NSInteger section;
@property(nonatomic,copy)NSString *title;


@end
