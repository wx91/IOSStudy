//
//  Person.m
//  01.02Person
//
//  Created by wangx on 15/9/3.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)shoping:(float)price{
    NSLog(@"%@ 我正在购物,物品价格：%f",_name,price);
    
}



/*
 *方法描述：设置属性_name
 */
-(void)setName:(NSString *)name{
    _name=name;
}
-(void)setAge:(NSInteger)age{
    _age=age;
}
/*
 *方法描述：获取属性的值:_name
 */
-(NSString *)name{
    return _name;
}
-(NSInteger)age{
    return _age;
}

-(void)setName:(NSString *)name
        setAge:(NSInteger)age{
    _name=name;
    _age=age;
}
+(Person *)newPerson{
    Person *p=[[Person alloc]init];
    return p;  
}
+(void)testClass{
    NSLog(@"这是类方法");
}
 
@end
