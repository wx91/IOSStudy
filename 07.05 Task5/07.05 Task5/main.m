//
//  main.m
//  07.05 Task5
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Person.h"
int main(int argc, char * argv[]) {
    @autoreleasepool {
        /*
        //NSString 读写文件
        //1.NSString写文件
        NSString *s=@"无限互联";
        NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/file.txt"];
        //将字符串写入文件
        BOOL success=[s writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        if (success) {
            NSLog(@"字符写入成功");
        }
        //NSString读文件
        //创建字符串对象时，同时读取文件路径对应的文件内容
        NSString *string=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"string=%@",string);
        */
        /*
        //1.NSData读、写文件
        //1.NSData读文件
        //文件路径
        NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/file.txt"];
        //创建NSData时，同时读取文件的内容
        NSData *data=[[NSData alloc]initWithContentsOfFile:path];
        NSString *string=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",string);
        //2.NSData写文件
//        [data writeToFile:<#(nonnull NSString *)#> atomically:<#(BOOL)#>]
        */
        /*
         *注意：NSArray、NSDictionary中只能存入，NSString，NSNumber，NSDate，NSData，NSArray，NSDictionary
         *才能成功写入文件，写入的文件我们称之为属性列表文件。
         */
        /*
        //1.NSArray写文件
        NSString *s1=@"zhangsan";
        NSString *s2=@"李四";
        NSArray *array=[[NSArray alloc]initWithObjects:s1,s2,nil];
        NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array.plist"];
        BOOL success=[array writeToFile:path atomically:YES];
        if (success) {
            NSLog(@"写入成功!");
        }
        */
        /*
         *注意：NSArray、NSDictionary中只能存入，NSString，NSNumber，NSDate，NSData，NSArray，NSDictionary
         *以外的对象，则无法写入文件
         
        Person *person=[[Person alloc]init];
        NSArray *array2=[NSArray arrayWithObjects:person,@"demo",nil];
        NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array2.plist"];
        BOOL success2=[array2 writeToFile:path atomically:YES];
        if (success2) {
            NSLog(@"写入成功!");
        }
        
        //读文件
        NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/array.plist"];
        NSArray *readArray=[[NSArray alloc]initWithContentsOfFile:path];
        for (NSString *s in readArray) {
            NSLog(@"s=%@",s);
        }
        */
        /*
        //NSDictionary读、写文件
        //1.NSDictionary写文件
        NSDictionary *dic=@{
            @"name":@"jack",
            @"brithday":[NSDate date],
            @"age":@22
        };
        NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/dic.plist"];
        BOOL success=[dic writeToFile:path atomically:YES];
        if (success) {
            NSLog(@"写入成功");
        }
        //2.NSDictionary 读文件
        NSDictionary *readDic=[NSDictionary dictionaryWithContentsOfFile:path];
        NSLog(@"%@",readDic);
        */
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
