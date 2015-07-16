//
//  RootViewController.m
//  3.3 ModalVIewController
//
//  Created by wangx on 15/6/22.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "RootViewController.h"
#import "ModalViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

-(void)loadView{
    [super loadView];
    self.view.backgroundColor=[UIColor purpleColor];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.tag=101;
    button.frame=CGRectMake(320/2-140/2, 80, 140, 40);
    [button setTitle:@"Present" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(presentModalVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(90, 120, 140, 40)];
    label.text=@"Hello Wolrd";
    label.tag=102;
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)presentModalVC{
    ModalViewController *modalVC=[[ModalViewController alloc]init];
    modalVC.modalTransitionStyle=UIModalTransitionStylePartialCurl;
    //设置代理
    modalVC.delegate=self;
    if ([[UIDevice currentDevice].systemVersion floatValue]<6.0) {
        [self presentModalViewController:modalVC animated:YES];
    }else{
        [self presentViewController:modalVC animated:YES completion:^{
            NSLog(@"call back");
        }];
        
    }
}

-(void)changeLabelText:(NSString *)text{
    UILabel *label=(UILabel *)[self.view viewWithTag:102];
    label.text=text;
}

@end
