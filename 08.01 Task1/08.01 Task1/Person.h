//
//  Person.h
//  08.01 Task1
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
@interface Person : NSObject{
    @private
    NSString *_name;
    Dog *_dog;
    NSUInteger _age;
}

@end
