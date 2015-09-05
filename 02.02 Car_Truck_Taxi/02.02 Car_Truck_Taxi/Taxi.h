//
//  Taxi.h
//  02.02 Car_Truck_Taxi
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Car.h"

@interface Taxi : Car{
    NSString *_company;     //所属公司
}
-(instancetype)initWithCompany:(NSString *)company;

//打印发票
-(void)printTick;

@end
