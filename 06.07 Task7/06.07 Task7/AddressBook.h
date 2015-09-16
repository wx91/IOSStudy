//
//  AddressBook.h
//  06.07 Task7
//
//  Created by wangx on 15/9/16.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
//设计单例类的目的：限制这个类只能创建一个对象
/**
 *  单例的应用场景：
 *  1.单例对象可以存储一些共享的信息，每个对象都能访问和修改
 *  2.如果一个类的创建非常的耗费性能，那么这个类最好设计为单例，只创建一次来节约性能
 */

@interface AddressBook : NSObject<NSCopying>

+(AddressBook *)shareInstance;

@end
