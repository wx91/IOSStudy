//
//  Car.h
//  01.03 Car
//
//  Created by wangx on 15/9/4.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject{
    NSString *_name;
    NSUInteger    *_speed;
}
-(void)setName:(NSString *)name;

-(void)setSpeed:(NSUInteger)speed;


@end
