//
//  Car.h
//  02.07 Pricate
//
//  Created by wangx on 15/9/6.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject{
@protected//受保护的属性，默认是@protected修饰的，子类可以访问此修辞属性
    NSString *_name;
@private    //使用@private修饰的属性是私有的，只能本类才可以访问，子类无法访问
    NSString *_brand;
@public     //共有的属性，内部，外部都能直接访问
    NSString *_color;
//@package   //使用@package修饰的属性，只能在当前框架中才能被访问
    
}
-(instancetype)initWithName:(NSString *)name;

-(void)run;

@end
