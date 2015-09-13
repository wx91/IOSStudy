//
//  Student.m
//  05.02 Task2
//
//  Created by wangx on 15/9/13.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Student.h"

@implementation Student

-(void)setCode:(NSString *)code{
    if (_code!=code) {
        [_code release];
        _code=[code copy];
    }
}

-(NSString *)code{
    return _code;
}

-(void)dealloc{
    //调用父类的dealloc，让父类释放所持有的对象。
    
    [_code release];
    NSLog(@"student dealloc");
    [super dealloc];
}

@end
