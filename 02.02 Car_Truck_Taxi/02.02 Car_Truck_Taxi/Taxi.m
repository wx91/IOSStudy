//
//  Taxi.m
//  02.02 Car_Truck_Taxi
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Taxi.h"

@implementation Taxi

-(instancetype)initWithCompany:(NSString *)company{
    self=[super init];
    if (self) {
        _company=company;
    }
    return self;
}
//打印发票
-(void)printTick{
    NSLog(@"%@出租车打印了发票，公司为：%@，颜色为：%@",_brand,_company,_color);
}
@end
