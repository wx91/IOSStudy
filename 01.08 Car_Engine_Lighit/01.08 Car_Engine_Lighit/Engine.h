//
//  Engine.h
//  01.08 Car_Engine_Lighit
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Engine : NSObject{
    NSString *_model;   //型号
    float _capacity;    //排量
}

-(instancetype)initWithModel:(NSString *)model withCapacity:(float)capacity;

//转动
-(void)turn;
//停止转动
-(void)stopTurn;

@end
