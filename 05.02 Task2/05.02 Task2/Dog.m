//
//  Dog.m
//  05.02 Task2
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Dog.h"

/**
 *  1.给全局对象赋值的时候，需要将次对象retian
 *  2.在dealloc中对全局的对象release
 */
@implementation Dog



-(void)setName:(NSString *)name{
    _name=name;
}

-(NSString *)name{
    return _name;
}
-(void)dealloc{
    NSLog(@"Dog对象销毁");
    [super dealloc];
}

@end
