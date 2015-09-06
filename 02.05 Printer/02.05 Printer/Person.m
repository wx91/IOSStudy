//
//  Person.m
//  02.05 Printer
//
//  Created by wangx on 15/9/6.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Person.h"

@implementation Person


//使用彩色打印机
//-(void)printWithColor:(ColorPrinter *)colorPrinter{
//    [colorPrinter print];
//}
//使用黑白打印机
//-(void)printwithBlack:(BlackPrinter *)blackPrinter{
//    [blackPrinter print];
//}
//使用激光打印机的方法
//-(void)printXXXX:(XXXX *)print;

//使用3D打印机的方法
//-(void)printXXX:(XXXX *)print;
//父类声明的变量，可以指向子类对象
-(void)print:(Printer *)printer{
    [printer print];
}

@end
