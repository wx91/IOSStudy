//
//  main.m
//  02.05 Printer
//
//  Created by wangx on 15/9/6.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlackPrinter.h"
#import "ColorPrinter.h"
#import "Person.h"
#import "Printer.h"
#import "ThreeDPrinter.h"
int main(int argc, const char * argv[]) {
    
//    Person *person=[[Person alloc]init];
    
//    ColorPrinter *colorPrint=[[ColorPrinter alloc]init];
//    BlackPrinter *blackPrint=[[BlackPrinter alloc]init];
//    [person printwithBlack:blackPrint];
//    [person printWithColor:colorPrint];
    /* Animal（动物）
     * 狗 *dog=[[狗 alloc]init];
     * 动物 *dog=[[狗 alloc]init];
     */
    /*
     * 父类声明的变量，可以指向子类对象
     */
//    Printer *p1=[[ColorPrinter alloc]init];
//    Printer *p2=[[BlackPrinter alloc]init];
//    
//    [person printWithColor:p1];
//    [person printwithBlack:p2];
    //——————————————————使用多态
    Person *person=[[Person alloc]init];
    ColorPrinter *colorPrint=[[ColorPrinter alloc]init];
    BlackPrinter *blackPrint=[[BlackPrinter alloc]init];
    ThreeDPrinter *threeDPrint=[[ThreeDPrinter alloc]init];
    
    
//    [person print:colorPrint];
//    [person print:blackPrint];
//    [person print:threeDPrint];
    int cmd;
    do {
        NSLog(@"请输入打印机编号");
        scanf("%d",&cmd);
        if (cmd==1) {
            [person print:threeDPrint];
        }else if (cmd==2){
            [person print:colorPrint];
        }else if (cmd==3){
            [person print:blackPrint];
        }
    } while (1);
    /*
     * 多态产生条件
     * 1.要有继承
     * 2.要有方法覆写
     * 3.父类声明的变量，指向子类对象
     */
    
    
    return 0;
}
