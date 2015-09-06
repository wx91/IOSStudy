//
//  main.m
//  02.06 Instrument
//
//  Created by wangx on 15/9/6.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Instrument.h"
#import "Piano.h"
#import "Violin.h"
#import "Actor.h"

int main(int argc, const char * argv[]) {
    
    Actor *actor=[[Actor alloc]init];
    
    Piano *pino =[[Piano alloc]init];
    Violin *vlolin=[[Violin alloc]init];
    NSLog(@"请选择演奏家的乐器:");
    NSLog(@"1.钢琴,2.小提琴");
    int cmd;
    scanf("%d",&cmd);
    if (cmd==1) {
        [actor play:pino];
    }else if (cmd==2){
        [actor play:vlolin];
    }else{
        NSLog(@"没有此乐器");
    }
    
    
    return 0;
}
