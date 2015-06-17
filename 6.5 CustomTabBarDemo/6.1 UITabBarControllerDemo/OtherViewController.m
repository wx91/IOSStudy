//
//  OtherViewController.m
//  6.1 UITabBarControllerDemo
//
//  Created by wangx on 15/6/17.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "OtherViewController.h"

@implementation OtherViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"其他";
    }
    return self;
}
-(void)loadView{
    UIView *view=[[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    view.backgroundColor=[UIColor purpleColor];
    self.view=view;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
