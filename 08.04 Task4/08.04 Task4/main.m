//
//  main.m
//  08.04 Task4
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Children.h"
#import "Nure.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Children *children=[[Children alloc]init];
        Nure *nure=[[Nure alloc]initWithChildren:children];
        [[NSRunLoop currentRunLoop]run];
    }
    return 0;
}
