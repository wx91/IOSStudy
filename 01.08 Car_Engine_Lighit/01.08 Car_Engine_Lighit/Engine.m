//
//  Engine.m
//  01.08 Car_Engine_Lighit
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Engine.h"

@implementation Engine

-(instancetype)initWithModel:(NSString *)model withCapacity:(float)capacity{
    self=[super init];
    if (self) {
        _model=model;
        _capacity=capacity;
    }
    return self;
}

//转动
-(void)turn{
    NSLog(@"型号为：%@，排量为：%.2f,的引擎开始转动了",_model,_capacity);
}
//停止转动
-(void)stopTurn{
    NSLog(@"型号为：%@，排量为：%.2f,的引擎停止转动了",_model,_capacity);
}
@end
