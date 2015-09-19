//
//  main.m
//  07.02 Task2
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    //演示路径
    NSString *path=@"/Users/wangx/file.txt";
    NSLog(@"演示路径%@",path);
    
    //1.返回路径的组成部分
    NSArray *array=[path pathComponents];
    NSLog(@"pathComponents:%@",array);
    
    //2.路径的最后组成部分
    NSString *lastComponent=[path lastPathComponent];
    NSLog(@"lastComponent%@",lastComponent);
    
    //3.追加子路径
    NSString *newPath1=[path stringByAppendingString:@"/appFile.txt"];
    NSLog(@"newPath1=%@",newPath1);
    
    NSString *newPath2=[path stringByAppendingPathComponent:@"appFile.txt"];
    NSLog(@"newPath2=%@",newPath2);
    
    //4.删除最后的组成部分
    NSString *deleteLast=[path stringByDeletingLastPathComponent];
    NSLog(@"deleteLast:%@",deleteLast);
    NSString *deleteExtension=[path stringByDeletingPathExtension];
    
    //5.删除扩展名
    NSLog(@"deleteExtension:%@",deleteExtension);
    
    //6.获取路径对最后部分的扩展名
    NSString *extension =[path pathExtension];
    NSLog(@"extension:%@",extension);
    
    //7.追加扩展名
    NSString *appendExt=[path stringByAppendingPathExtension:@"jpg"];
    NSLog(@"appendExt:%@",appendExt);
    
    //NSString ---->NSData
    NSString *s=@"sadfsddgdfgdf";
    NSData *data=[s dataUsingEncoding:NSUTF8StringEncoding];
    
    //NSData--->NSString
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"str=%@",str);
    
    //NSMutableData 可变的NSData对象,可以追加数据
    
    
    return 0;
}
