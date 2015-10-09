//
//  MainViewController.m
//  9.3 EventDemo
//
//  Created by wangx on 15/6/27.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "MainViewController.h"
#import "TouchView.h"
@implementation MainViewController

-(void)loadView{
    [super loadView];
    TouchView *touchView=[[TouchView alloc]initWithFrame:CGRectMake(0, 0, 320, 359)];
    touchView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:touchView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"MainViewController touchesBegan");
    [self.nextResponder touchesBegan:touches withEvent:event];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
