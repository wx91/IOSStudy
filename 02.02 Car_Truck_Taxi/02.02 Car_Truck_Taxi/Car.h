//
//  Car.h
//  02.02 Car_Truck_Taxi
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject{
    NSString *_brand;   //品牌
    NSString *_color;   //颜色
}
-(void)setBrand:(NSString *)brand;

-(void)setColor:(NSString *)color;

//刹车
-(void)brake;
//加速
-(void)quciken;


@end
