//
//  Dog.h
//  01.07 Dog_Person
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject{
    NSString *_name;
    NSString *_color;
}
-(instancetype)initWithName:(NSString *)name withColor:(NSString *)color;

//跑步
-(void)run;
//接球
-(void)playBall;
//叫
-(void)call;


@end
