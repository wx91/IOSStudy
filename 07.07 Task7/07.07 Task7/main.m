//
//  main.m
//  07.07 Task7
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *homePath=NSHomeDirectory();
        //文件过大导致内存占用过多。
        NSString *srcPath=[homePath stringByAppendingPathComponent:@"欠条-赵刚飞.txt"];
        //目标路径
        NSString *targetPath=[homePath stringByAppendingPathComponent:@"Documents/欠条-赵刚飞.txt"];
        /*
         *注意：使用NSFileHandle只能读写已经存在的文件，不能创建文件
         *使用NSFileManager创建文件
         */
        NSFileManager *fileManager=[NSFileManager defaultManager];
        //创建目标文件
        BOOL success=[fileManager createFileAtPath:targetPath contents:nil attributes:nil];
        if (success) {
            NSLog(@"目标文件创建成功");
        }
        //创建用于读取文件的NSFileHandle对象
        NSFileHandle *readHandle=[NSFileHandle fileHandleForReadingAtPath:srcPath];
        //创建用于写入的NSFileHandle对象
        NSFileHandle *writeHandle=[NSFileHandle fileHandleForWritingAtPath:targetPath];
        //从当前偏移量读到文件的末尾，偏移量默认是起始位置
        //NSData *data=[readHandle readDataToEndOfFile];
        NSData *data=[readHandle availableData];
        //将数据写入目标文件
        [writeHandle writeData:data];
        //关闭文件
        [writeHandle closeFile];
        [readHandle closeFile];
    }
    return 0;
}
