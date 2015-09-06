//
//  Car.m
//  02.07 Pricate
//
//  Created by wangx on 15/9/6.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Car.h"

@implementation Car

-(instancetype)initWithName:(NSString *)name{
    self=[super init];
    if (self) {
        _name=name;
    }
    return self;
}
-(void)run{
    
}

@end
