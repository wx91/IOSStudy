//
//  Truck.h
//  02.02 Car_Truck_Taxi
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Truck : Car{
    float _maxWeight;   //最大载货量
}

-(instancetype)initWithMaxWeight:(float)maxWeight;

//卸货
-(void)unload;


@end
