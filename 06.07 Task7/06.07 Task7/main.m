//
//  main.m
//  06.07 Task7
//
//  Created by wangx on 15/9/16.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressBook.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AddressBook *book1=[AddressBook shareInstance];
        AddressBook *book2=[AddressBook shareInstance];
        NSLog(@"%p",book1);
        NSLog(@"%p",book2);
        
        AddressBook *book3=[[AddressBook alloc]init];
        NSLog(@"book3=%p",book3);
        
        AddressBook *book4=[book3 copy];
        NSLog(@"book4=%p",book4);
    }
    return 0;
}
