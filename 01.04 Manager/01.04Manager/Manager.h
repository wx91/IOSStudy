//
//  Manager.h
//  01.04Manager
//
//  Created by wangx on 15/9/4.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject{
    NSString *_username;
    NSInteger _password;
}
-(void)setUsername:(NSString *)username;
-(NSString *)username;


-(void)setPassword:(NSInteger )password;
-(NSInteger)password;

//修改密码
-(BOOL)changePassword;
//打印此管理员信息
-(void)showInfo;


@end
