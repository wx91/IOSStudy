//
//  Nanny.m
//  04.06 Task6
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Nanny.h"
#import "Children.h"

@implementation Nanny

-(void)wash:(Children *)children{
    NSLog(@"小孩脏了,护士帮小孩洗澡了");
}

-(void)play:(Children *)children{
    NSLog(@"小孩哭了,护士逗小孩洗澡了");
}

@end
