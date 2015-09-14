//
//  Person.h
//  05.06 Task6
//
//  Created by wangx on 15/9/14.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    NSString *_name;
}

+(instancetype)PersonWithName:(NSString *)name;
@end
