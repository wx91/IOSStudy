//
//  NSString+Extension.m
//  04.01 task1
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

-(BOOL)validateEmail{
    //查找是否有@符号，有的话验证通过，反之不通过
    //查找字符串
    NSRange range=[self rangeOfString:@"@"];
    if (range.location==NSNotFound) {
        return NO;
    }
    return YES;
}

-(int)intValue{
    
    NSLog(@"intValue");
    return 100;
}

@end
