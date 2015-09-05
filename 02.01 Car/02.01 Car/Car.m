//
//  Car.m
//  02.01 Car
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Car.h"

@implementation Car

-(void)setCapcity:(float)capcity{
    if (capcity<0.5) {
        NSLog(@"优良设置不正确!");
        return ;
    }
    _capcity=capcity;
}

-(void)run:(float)t{
    //1.调用引擎转动
    
    //2.轴承转动
    
    //3.轮子转动
    
}
@end
