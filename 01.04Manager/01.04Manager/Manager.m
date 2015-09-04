//
//  Manager.m
//  01.04Manager
//
//  Created by wangx on 15/9/4.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Manager.h"

@implementation Manager

-(void)setUsername:(NSString *)username{
    _username=username;
}
-(NSString *)username{
    return _username;
}


-(void)setPassword:(NSInteger)password{
    _password=password;
}
-(NSInteger)password{
    return _password;
}

//修改密码
-(BOOL)changePassword{
    NSLog(@"请输入旧密码");
    int oldPass;
    scanf("%d",&oldPass);
    //输入的密码与原密码一致允许修改
    if (oldPass==_password) {
        NSLog(@"请输入新的密码");
        int newPass;
        scanf("%d",&newPass);
        _password=newPass;
        NSLog(@"修改成功");
        return YES;
    }
    NSLog(@"密码不匹配，修改失败!");
    return NO;
}
//打印此管理员信息
-(void)showInfo{
    NSLog(@"管理员的信息:%@   %ld",_username,_password);
}

@end
