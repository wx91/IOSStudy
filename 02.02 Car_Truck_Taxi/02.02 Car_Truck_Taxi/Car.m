//
//  Car.m
//  02.02 Car_Truck_Taxi
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Car.h"

@implementation Car
-(void)setBrand:(NSString *)brand{
    _brand=brand;
}

-(void)setColor:(NSString *)color{
    _color=color;
}
//刹车
-(void)brake{
    NSLog(@"%@汽车刹车了,颜色为:%@",_brand,_color);
}
//加速
-(void)quciken{
    NSLog(@"%@汽车加速了,颜色为:%@",_brand,_color);
}
@end
