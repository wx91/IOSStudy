//
//  ExtensionString.m
//  04.01 task1
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "ExtensionString.h"

@implementation ExtensionString


-(BOOL)validateEmail{
    //查找是否有@符号，有的话验证通过，反之不通过
    //查找字符串
    NSRange range=[self rangeOfString:@"@"];
    if (range.location==NSNotFound) {
        return NO;
    }
    return YES;
}

@end
