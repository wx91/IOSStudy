//
//  main.m
//  03.02 NSStringDemo
//
//  Created by wangx on 15/9/7.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    // 不可变字符串NSString
    //1.字符串的创建
    //创建字符串常量
    NSString *string1=@"hello";
    //创建Hello World 字符串对象，并把指针地址给予string1
    string1=@"Hello World";
    //创建字符串
    NSString *string2=[[NSString alloc]initWithString:@"Hello"];
    NSString *string3=[[NSString alloc]initWithFormat:@"Hello %@",string2];
    NSLog(@"string2=%@",string2);
    NSLog(@"string2=%@",string3);
    
    NSString *s1=@"张三";
    NSString *s2=@"李四";
    NSString *s3=@"王五";
    NSString *string4=[[NSString alloc]initWithFormat:@"%@,%@,%@",s1,s2,s3];
    NSLog(@"string4=%@",string4);
    
    int age=24;
    NSString *string5=[[NSString alloc]initWithFormat:@"%@的年龄:age=%d",s1,age];
    NSLog(@"%@",string5);
    
    //2.字符串比较
    NSString *string6=@"abcd";
    NSString *string7=@"8888";
    //以下是比较两个指针地址是相同，而不是比较字符串中的内容
//    if (string6==string7) { }
    //isEqualToString 比较两个字符串的内容是否相同(区分大小写)
    if ([string6 isEqualToString:string7]) {
        NSLog(@"内容相同");
    }
    //字符常量，在常量区，两个指向同一个地址
    NSString *string8=@"abc";
    NSString *string9=@"abc";
    if(string8==string9){
        NSLog(@"string8==string9");
    }
    
    NSString *string10=[[NSString alloc]initWithFormat:@"abc%@",@"def" ];
    NSString *string11=[[NSString alloc]initWithFormat:@"abc%@",@"def" ];
    if(string10==string11){
        NSLog(@"string10==string11");
    }
    if([string10 isEqualToString:string11]){
        NSLog(@"string10,string11内容相同");
    }
    NSString *string12=[[NSString alloc]initWithString:@"abc"];
    NSString *string13=[[NSString alloc]initWithString:@"abc"];
    if(string12==string13){
        NSLog(@"string12==string13");
    }
    
    //比较大小
    NSString *string14=@"zhangsan";
    NSString *string15=@"ZHANGSAN";
    //caseInsensitiveCompare: 忽略大小写比较
    NSComparisonResult result=[string14 caseInsensitiveCompare:string15];
    if(result==NSOrderedSame){
        NSLog(@"string14,string16 忽略大小写相同");
    }
    NSString *string16=@"10";//@"a"
    NSString *string17=@"11";//@"b"
    //比较大小
    NSComparisonResult *result2=[string16 compare:string17];
    if (result2==NSOrderedAscending) {
        NSLog(@"string16<string17");
    }else if (result2==NSOrderedSame){
        NSLog(@"string16,string17相同");
    }else if (result2==NSOrderedDescending){
        NSLog(@"string16>string17");
    }
    
    return 0;
}
