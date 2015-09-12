 //
//  Children.m
//  04.06 Task6
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Children.h"

@implementation Children
-(instancetype)init{
    self=[super init];
    if (self) {
        [NSTimer scheduledTimerWithTimeInterval:1
                                         target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    }
    return self;
}

//-(void)setNure:(Nure *)nure{
//    _nure=nure;
//}

//-(void)setNanny:(Nanny *)nanny{
//    _nanny=nanny;
//}

-(void)setDelegate:(id)delegate{
    _delegate=delegate;
}

- (void)timerAction:(NSTimer *)timer {
    timeValue++;
    if (timeValue==5) {
        //小孩子不清洁了
        //调用保姆给小孩洗澡
//        [_nure wash:self];
//        [_nanny washBoy:self];
        [_delegate wash:self];
    }
    if (timeValue==10) {
        //小孩哭了
        //调用保姆给小孩玩耍
//        [_nure play:self];
//        [_nanny playBoy:self];
        [_delegate  play:self];
    }
    
    
}

@end
