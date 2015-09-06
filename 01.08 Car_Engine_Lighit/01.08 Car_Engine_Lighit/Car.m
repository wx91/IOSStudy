//
//  Car.m
//  01.08 Car_Engine_Lighit
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Car.h"

@implementation Car
-(instancetype)initWithEngine:(Engine *)engine withLamp:(Lamp *)lamp{
    self=[super init];
    if (self) {
        _engine=engine;
        _lamp=lamp;
    }
    return self;
}

-(void)setName:(NSString *)name{
    _name=name;
}
-(void)setLicence:(NSString *)licence{
    _licence=licence;
}

-(void)run{
    NSLog(@"牌号为：%@的%@汽车开始启动了",_licence,_name);
    //调用引擎转动的方法
    [_engine turn];
    //调用车灯亮灯的方法
    [_lamp light];
}
-(void)stop{
    NSLog(@"牌号为：%@的%@汽车开始停止了",_licence,_name);
    //调用引擎停止转动的方法
    [_engine stopTurn];
    //调用车灯熄灭的方法
    [_lamp dark];
}
@end
