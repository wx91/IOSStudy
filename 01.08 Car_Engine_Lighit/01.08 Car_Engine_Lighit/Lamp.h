//
//  Lamp.h
//  01.08 Car_Engine_Lighit
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lamp : NSObject{
    float _wattage;//瓦数
}
-(instancetype)initWithWattage:(float)wattage;

//亮灯
-(void)light;
//熄灯
-(void)dark;

@end
