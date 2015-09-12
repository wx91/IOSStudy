//
//  main.m
//  04.01 task1
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExtensionString.h"
#import "NSString+Extension.h"


int main(int argc, const char * argv[]) {
    /*
    ExtensionString *str=[[ExtensionString alloc]initWithString:@"123456@qq.com"];
    BOOL isEmail=[str validateEmail];
    if (isEmail) {
        NSLog(@"验证通过");
    }else{
        NSLog(@"邮箱不合法");
    }
     */
    NSString *str=@"123456@qq.com";
    BOOL isEmail=[str validateEmail];
    if (isEmail) {
        NSLog(@"验证通过");
    }else{
        NSLog(@"邮箱不合法");
    }
    
    int len=[str intValue];
    
    return 0;
}
