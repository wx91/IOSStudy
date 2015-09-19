//
//  main.m
//  07.01 Task
//
//  Created by wangx on 15/9/16.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSString *homePath=NSHomeDirectory();
        NSLog(@"沙盒目录%@",homePath);
        NSString *docPath1=[NSString stringWithFormat:@"%@/Documents",homePath];
        NSString *docPath2=[homePath stringByAppendingFormat:@"%@",@"/Documents"];
        NSLog(@"docPath1=%@,docPath2=%@",docPath1,docPath2);

        
        /*
         *  NSDocumentDirectory:Documents文件夹
         *  
         */
        NSArray *array=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        NSLog(@"%@",array);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
