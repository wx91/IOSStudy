//
//  ModalViewController.m
//  3.3 ModalVIewController
//
//  Created by wangx on 15/6/22.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

-(void)loadView{
    self.view=[[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    self.view.backgroundColor=[UIColor orangeColor];
    
    _textField=[[UITextField alloc]initWithFrame:CGRectMake(70, 100, 180, 30)];
    _textField.borderStyle=UITextBorderStyleRoundedRect;
    [_textField becomeFirstResponder];
    [self.view addSubview:_textField];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(320/2-140/2, 180, 140, 40);
    [button setTitle:@"diss" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismiss{
    //改变label的内容
    if([self.delegate respondsToSelector:@selector(changeLabelText:)]){
        [self.delegate changeLabelText:_textField.text];
    }
    if ([[UIDevice currentDevice].systemVersion floatValue] < 6.0) {
        [self dismissModalViewControllerAnimated:YES];
    }else {
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }
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
