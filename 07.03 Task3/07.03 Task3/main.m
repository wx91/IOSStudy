//
//  main.m
//  07.03 Task3
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        /*
        //1.创建文件
        //获取当前app的沙盒目录
        NSString *homePath=NSHomeDirectory();
        //追加子路径
        NSString *filePath=[homePath stringByAppendingPathComponent:@"Documents/file.txt"];
        //NSFileManager 不能使用alloc创建，这个类设计为单实例对象
        //NSFileManager *fileM=[NSFileManager alloc]init];
        //NSFileManager 只能通过类方法defaultManager创建
        NSFileManager *fileManager=[NSFileManager defaultManager];
        NSString *string=@"无限互联";
        NSData *data=[string dataUsingEncoding:NSUTF8StringEncoding];
        //根据路径filePath创建对应文件，注意：只能创建文件，不能创建目录（文件夹）
        BOOL success=[fileManager createFileAtPath:filePath contents:data attributes:nil];
        if (success) {
            NSLog(@"文件创建成功！");
        }else{
            NSLog(@"文件创建失败!");
        }
        
        //创建文件夹
        NSString *filePath2=[homePath stringByAppendingPathComponent:@"Documents/demo"];
        NSError *error;
        BOOL success1=[fileManager createDirectoryAtPath:filePath2 withIntermediateDirectories:YES attributes:nil error:&error];
        if (!success1) {
            NSLog(@"创建失败:%@",error);
        }
        */
        /*
        //2.读取文件
        //获取当前app的沙盒目录
        NSString *homePath=NSHomeDirectory();
        //追加子路径
        NSString *filePath=[homePath stringByAppendingPathComponent:@"Documents/file.txt"];
        
        NSFileManager *fileManager=[NSFileManager defaultManager];
        //根据路径读取文件中的数据
        NSData *data=[fileManager contentsAtPath:filePath];
        //NSData 转 NSString字符串
        NSString *string=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",string);
        */
        /*
        //3.移动（剪切）文件
        //获取当前app的沙盒目录
        NSString *homePath=NSHomeDirectory();
        //源路径
        NSString *filePath=[homePath stringByAppendingPathComponent:@"Documents/file.txt"];
        //目标路径
        NSString *targetPath=[homePath stringByAppendingPathComponent:@"Documents/demo/file2.txt"];
        NSFileManager *fileManager=[NSFileManager defaultManager];
        BOOL success=[fileManager moveItemAtPath:filePath toPath:targetPath error:nil];
        if (!success) {
            NSLog(@"移动失败!");
        }
        */
        /*
        //4.复制文件
        //获取当前app的沙盒目录
        NSString *homePath=NSHomeDirectory();
        //源路径
        NSString *filePath=[homePath stringByAppendingPathComponent:@"Documents/demo/file3.txt"];
        //目标路径
        NSString *targetPath=[homePath stringByAppendingPathComponent:@"Documents/file.txt"];
        NSFileManager *fileManager=[NSFileManager defaultManager];
        BOOL success=[fileManager copyItemAtPath:filePath toPath:targetPath error:nil];
        if (!success) {
            NSLog(@"复制失败!");
        }
        */
        /*
        //4.删除文件
        //获取当前app的沙盒目录
        NSString *homePath=NSHomeDirectory();
        //源路径
        NSString *filePath=[homePath stringByAppendingPathComponent:@"Documents/demo/file3.txt"];
        NSFileManager *fileManager=[NSFileManager defaultManager];
        //判断文件是是否存在
        BOOL fileExist=[fileManager fileExistsAtPath:filePath];
        if(fileExist){
            //删除文件
            BOOL success=[fileManager removeItemAtPath:filePath error:nil];
            if (success) {
                NSLog(@"删除成功！");
            }
        }
         */
        
        //5.获取文件属性
        NSString *homePath=NSHomeDirectory();
        //目标路径
        NSString *filePath=[homePath stringByAppendingPathComponent:@"Documents/file.txt"];
        NSFileManager *fileManager=[NSFileManager defaultManager];
        //获取文件属性
        NSDictionary *fileAttr=[fileManager attributesOfItemAtPath:filePath error:nil];
        NSLog(@"%@",fileAttr);
        
        NSNumber *fileSize=[fileAttr objectForKey:NSFileSize];
        long sizeValue=[fileSize longLongValue];
        NSLog(@"文件大小：%ld",sizeValue);
        //如下读取文件的大小，不可取，因为将文件中的内存读取到内存中，文件大时，太占用内存了
        NSData *data=[fileManager contentsAtPath:filePath];
        NSUInteger *len=data.length;
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
