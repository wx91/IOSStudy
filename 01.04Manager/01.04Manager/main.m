//
//  main.m
//  01.04Manager
//
//  Created by wangx on 15/9/4.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Manager.h"

int main(int argc, const char * argv[]) {
    
    Manager *manager=[[Manager alloc]init];
    [manager setUsername:@"admin"];
    [manager setPassword:888888];
    //返回修改密码的结果
    BOOL result=[manager changePassword];
    //判断是否修改秘密成功
    if (result) {
        //打印管理员的信息
        [manager showInfo];
    }
    
    return 0;
}
