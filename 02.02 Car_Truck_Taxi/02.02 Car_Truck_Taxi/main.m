//
//  main.m
//  02.02 Car_Truck_Taxi
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Taxi.h"
#import "Truck.h"

int main(int argc, const char * argv[]) {
    
    //1.创建卡车类
    Truck *t1=[[Truck alloc]initWithMaxWeight:20];
    [t1 setBrand:@"东风"];
    [t1 setColor:@"红色"];
    [t1 brake];//从父类继承下来的刹车方法
    [t1 quciken];//从父类继承下来的加速。
    //自己特有的方法:卸货
    [t1 unload];
    
    Taxi *t2=[[Taxi alloc]initWithCompany:@"北京出租车有限公司"];
    t2.brand=@"现代";
    t2.color=@"黑色";
    [t2 brake];     //刹车
    [t2 printTick]; //打印发票
    
    Truck *t3=[[Truck alloc]initWithMaxWeight:20];
    [t3 setBrand:@"东风"];
    [t3 setColor:@"红色"];
    [t3 unload];
    
    return 0;
}
