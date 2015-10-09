//
//  EditorViewController.m
//  19.2 UserDemo
//
//  Created by wangx on 15/7/7.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "EditorViewController.h"
#import "UserModel.h"
#import "UserDB.h"

@interface EditorViewController ()

@end

@implementation EditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitAction:(id)sender {
    NSString *username=self.nameField.text;
    NSString *password=self.passField.text;
    NSString *age=self.ageField.text;
    UserModel *user=[[UserModel alloc]init];
    user.username=username;
    user.password=password;
    user.age=age;
    [[UserDB shareInstance]addUser:user];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
