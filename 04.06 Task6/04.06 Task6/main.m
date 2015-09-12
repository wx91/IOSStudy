//
//  main.m
//  04.06 Task6
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Children.h"
#import "Nure.h"
#import "Nanny.h"

int main(int argc, const char * argv[]) {
    Children *child=[[Children alloc]init];
    
    Nure *nure=[[Nure alloc]init];
    [child setDelegate:nure];
    
    Nanny *nanny=[[Nanny alloc]init];
    [child setDelegate:nanny];
    
    [[NSRunLoop currentRunLoop]run];
    return 0;
}
