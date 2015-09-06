//
//  main.m
//  01.08 Car_Engine_Lighit
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lamp.h"
#import "Engine.h"
#import "Car.h"
int main(int argc, const char * argv[]) {
    Engine *eng=[[Engine alloc]initWithModel:@"VS1001" withCapacity:2.0];
    Lamp *lamp=[[Lamp alloc]initWithWattage:60.0];
    
    Car *car=[[Car alloc]initWithEngine:eng withLamp:lamp];
    car.name=@"奔驰";//等价于[car setName:@""];
    [car setLicence:@"P10001"];
    
    int cmd;
    NSLog(@"请输入指令");
    scanf("%d",&cmd);
    if (cmd==1) {
        [car run];
    }else if (cmd==2){
        [car stop];
    }
    
    return 0;
}
