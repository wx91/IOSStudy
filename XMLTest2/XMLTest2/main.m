//
//  main.m
//  XMLTest2
//
//  Created by wangx on 15/5/18.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "main.h"
#import "NotesXMLParser.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NotesXMLParser *parser=[[NotesXMLParser alloc]init];
        [parser start];
    }
    return 0;
}
