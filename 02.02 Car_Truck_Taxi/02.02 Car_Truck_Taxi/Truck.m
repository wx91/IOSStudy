//
//  Truck.m
//  02.02 Car_Truck_Taxi
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Truck.h"

@implementation Truck

-(instancetype)initWithMaxWeight:(float)maxWeight{
    self=[super init];
    if (self) {
        _maxWeight=maxWeight;
    }
    return self;
}

-(void)test{
    
}

//卸货
-(void)unload{
//    [super test];//错误，父类中没有test方法的定义，调用不了
    //super关键字是调用父类中定义的方法
    //self 关键字是调用当前类中的方法，包括从父类中继承下来的方法
    //调用父类的刹车方法
//    [super brake];
    //
//    [self brake];
    
    //集成下来的属性：_brand、_color子类可以直接使用
    NSLog(@"%@的卡车卸货了，载货量：%.2f,汽车的颜色：%@",_brand,_maxWeight,_color);
}
@end
