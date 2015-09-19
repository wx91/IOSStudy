//
//  main.m
//  07.06 Task6
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    /*
    NSString *s=@"无限互联3G学院";
    //当前登录哟过户的主目录
    NSString *homePath=NSHomeDirectory();
    NSString *path=[homePath stringByAppendingPathComponent:@"file.txt"];
    //写入文件
    [s writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    //创建一个写入的NSFileHandle对象
    NSFileHandle *writeHandle=[NSFileHandle fileHandleForWritingAtPath:path];
    
    //将文件的偏移量设置到末尾，写入文件时则从末尾开始写入
    [writeHandle seekToEndOfFile];
    NSString *appendString=@"追加的数据";
    NSData *data=[appendString dataUsingEncoding:NSUTF8StringEncoding];
    
    //从当前偏移量写入数据
    [writeHandle writeData:data];
    //关闭文件
    [writeHandle closeFile];
     */
    //2.定位读取
    NSString *homePath=NSHomeDirectory();
    NSString *path=[homePath stringByAppendingPathComponent:@"file.txt"];
    //通过NSFileManager获取文件大小
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSDictionary *fileAttr=[fileManager attributesOfItemAtPath:path error:nil];
    NSNumber *fileSize=[fileAttr objectForKey:NSFileSize];
    long long sizValue=[fileSize longLongValue];
    NSFileHandle *readHandle=[NSFileHandle fileHandleForReadingAtPath:path];
    //设置偏移量
    [readHandle seekToFileOffset:sizValue/2];
    //从当前偏移量读取到文件末尾
    NSData *data=[readHandle readDataToEndOfFile];
    //NSData--->NSString
    NSString *string=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"string=%@",string);
    
    return 0;
}
