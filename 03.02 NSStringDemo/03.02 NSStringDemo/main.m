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
    
    //调用类方法创建字符串
    NSString *str1=[NSString stringWithString:@"hello"];
    NSString *str2=[NSString stringWithFormat:@"hello %@",str1];
    
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
    //字符串的长度
    //length:获字符串的长度
    NSString *string18=@"abcdef";//@"中文" 为2
    NSInteger len=[string18 length];
    NSLog(@"len=%ld",len);
    //转大小写
    NSString *string19=@"hELlo";
    //uppercaseString:将字符串中的字母全都转小写
    NSLog(@"upper:%@",[string19 uppercaseString]);
    //lowercaseString：转小写
    NSLog(@"lower:%@",[string19 lowercaseString]);
    //capitalizedString:首写字母大写
    NSLog(@"capitalizedString:%@",[string19 capitalizedString]);
    //将字符串转成基本类型
    NSString *string20=@"3.14";
    float f=[string20 floatValue];
    NSLog(@"floatValue:%f",f);
    NSString *string21=@"1";
    BOOL b=[string21 boolValue];//true
    
    //字符串的截取
    NSString *string22=@"abcdef";
    //substringToIndex:从字符串的开始位置截取到指定位置（不包含指定位置的字符）
    NSString *substring1=[string22 substringToIndex:3];
    NSLog(@"substring1=%@",substring1);
    //substringFromIndex:从指定位置截取到字符串的末尾（包含指定位置的字符）
    NSString *substring2=[string22 substringFromIndex:1];
    NSLog(@"substring2=%@",substring2);
    
    NSRange range={1,4};//1:指定位置，4：需要截取长度
//    NSRange range;
//    range.location=1;range.length=4;
//     NSRange range=NSMakeRange(1,4);
    NSString *substring3=[string22 substringWithRange:range];
    NSLog(@"substring3=%@",substring3);
    
    //字符串的追加
    NSString *string23=@"Android";
    //在字符串string23后面追加@" iOS",但不是修改string23字符串的内容，是返回一个新的字符串
    NSString *string24=[string23 stringByAppendingString:@" iOS"];
    NSString *string25=[string23 stringByAppendingFormat:@" %@ %d",@"iOS",7];
    NSLog(@"@string24=%@",string24);
    NSLog(@"@string25=%@",string25);
    
    //字符串的查找
    NSString *string26=@"www.iphonetrain.com/ios.html";
    NSRange rang=[string26 rangeOfString:@"ios"];
    //没有查找到
    if (rang.location!=NSNotFound) {
        NSLog(@"location:%ld,length:%ld",rang.location,rang.length);
    }
    //例如:如何判断邮箱地址是网易的邮箱
    //NSString *email=@"wxhl@163.com";
    
    NSString *string27=@"abcdef";
    unichar c=[string27 characterAtIndex:2];
    NSLog(@"c=%c",c);
   
    //NSMutableString
    //错误，此处是创建一个NSString对象，把NSString的指针给予NSMutableString
//    NSMutableString *ms1=@"zifuchuang";
    //insertString在原有的字符串基础上插入字符串
    NSMutableString *ms2=[[NSMutableString alloc]initWithString:@"字符串"];
    [ms2 insertString:@"可变" atIndex:0];
    NSLog(@"ms2=%@",ms2);
    
    //在原字符串基础上追加字符串
    [ms2 appendString:@"对象"];
    NSLog(@"ms2=%@",ms2);
    //把"符符"删除
    NSMutableString *ms3=[NSMutableString stringWithFormat:@"字符符符串"];
    //查找出"符符"的范围，然后根据范围删除指定的字符串
    NSRange deleteRange=[ms3 rangeOfString:@"符符"];
    [ms3 deleteCharactersInRange:deleteRange];
    NSLog(@"ms3=%@",ms3);
    
    NSMutableString *ms4=[NSMutableString stringWithString:@"字符串"];
    //查找出
    NSRange replaceRange=[ms4 rangeOfString:@"字符"];
    [ms4 replaceCharactersInRange:replaceRange withString:@"羊肉"];
    NSLog(@"ms4=%@",ms4);
    
    
    return 0;
}
