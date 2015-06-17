//
//  MessageViewController.m
//  6.1 UITabBarControllerDemo
//
//  Created by wangx on 15/6/17.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "MessageViewController.h"

@implementation MessageViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"消息";
    }
    return self;
}
-(void)loadView{
    [super loadView];
    UIView *view=[[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    view.backgroundColor=[UIColor orangeColor];
    self.view=view;
}


@end
