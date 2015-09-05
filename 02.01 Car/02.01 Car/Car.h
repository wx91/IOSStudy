//
//  Car.h
//  02.01 Car
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Car : NSObject{
//@public
@private
    float _capcity;
}

-(void)setCapcity:(float)capcity;

-(void)run:(float)t;
@end
