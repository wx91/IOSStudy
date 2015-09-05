//
//  Lamp.m
//  01.08 Car_Engine_Lighit
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Lamp.h"
//#include "Lamp.h" 多次导入会导致重复定义的问题
//#include "Lamp.h"
/*
 @interface Lamp : NSObject{
 float _wattage;//瓦数
 }
 */
//#include "Lamp.h"
/*
 @interface Lamp : NSObject{
 float _wattage;//瓦数
 }
 */
//#import "Lamp.h" 多次导入没有重复的问题，因为第二次导入时，
//#import指令会判断之前有没有导入,如果应经导入则不做导入操作

@implementation Lamp


-(instancetype)initWithWattage:(float)wattage{
    self=[super init];
    if (self) {
        _wattage=wattage;
    }
    return self;
}
//亮灯
-(void)light{
    NSLog(@"瓦数为%.2f的灯亮了!",_wattage);
}
//熄灯
-(void)dark{
    NSLog(@"瓦数为%.2f的灯熄灭了!",_wattage);
}
@end
