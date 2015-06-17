//
//  MainViewController.h
//  6.1 UITabBarControllerDemo
//
//  Created by wangx on 15/6/17.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITabBarController

@property(strong,nonatomic) UIImageView *selectView;

@property(strong,nonatomic)UIImageView *tabBarBG;

-(void)showTabBar;

-(void)hiddenTabBar;

@end
