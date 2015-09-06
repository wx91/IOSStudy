//
//  Person.h
//  02.05 Printer
//
//  Created by wangx on 15/9/6.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColorPrinter.h"
#import "BlackPrinter.h"

@interface Person : NSObject{
    NSString *_name;
}
//使用彩色打印机
//-(void)printWithColor:(ColorPrinter *)colorPrinter;

//使用黑白打印机
//-(void)printwithBlack:(BlackPrinter *)blackPrinter;

-(void)print:(Printer *)print;


@end
