//
//  NSString+Extension.m
//  04.03 task3
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

-(NSString *)sortString{
    NSMutableString *newString=[NSMutableString string];
    for (long i=self.length-1; i>=0; i--) {
        unichar c=[self characterAtIndex:i];
        [newString appendFormat:@"%c",c];
    }
    return newString;
}

@end
