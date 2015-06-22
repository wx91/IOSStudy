//
//  FirstViewController.m
//  3.2 UnLoadViewDemo
//
//  Created by wangx on 15/6/22.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"First";
    }
    return self;
}
-(void)loadView{
    UIView *baseView=[[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    baseView.backgroundColor=[UIColor orangeColor];
    self.view=baseView;
    
    _subView1=[[UIView alloc]initWithFrame:CGRectMake(60, 100, 200, 200)];
    _subView1.backgroundColor=[UIColor purpleColor];
    [self.view addSubview:_subView1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillUnload{
    [super viewWillUnload];
    NSLog(@"%s",__FUNCTION__);
}
-(void)viewDidUnload{
    [super viewDidUnload];
    NSLog(@"%s",__FUNCTION__);
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
