//
//  Car.h
//  01.08 Car_Engine_Lighit
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Engine.h"
#import "Lamp.h"
@interface Car : NSObject{
    NSString *_name;    //名称
    NSString *_licence;//车牌号
    
    Engine *_engine;
    Lamp *_lamp;
}
-(instancetype)initWithEngine:(Engine *)engine withLamp:(Lamp *)lamp;

-(void)setName:(NSString *)name;
-(void)setLicence:(NSString *)licence;

-(void)run;

-(void)stop;

@end
