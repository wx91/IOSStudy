//
//  Dog.h
//  05.02 Task2
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject{
    NSString *_name;
}

-(void)setName:(NSString *)name;

-(NSString *)name;

@end
