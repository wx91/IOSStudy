//
//  Student.h
//  05.02 Task2
//
//  Created by wangx on 15/9/13.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Person.h"

@interface Student : Person{
    NSString *_code;
}
-(void)setCode:(NSString *)code;

-(NSString *)code;

@end
