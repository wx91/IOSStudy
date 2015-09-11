//
//  main.m
//  03.07 NSDateDemo
//
//  Created by wangx on 15/9/11.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    //NSDate的使用
    //1.创建日期
    NSDate *date1=[NSDate date];//创建一个当前时间点的日期
    NSDate *date2=[[NSDate alloc]init];
    NSLog(@"date2:%@",date2);
    //在当前时间点的基础上累加一个数值之后的日期，单位是秒
    NSDate *date3=[NSDate dateWithTimeIntervalSinceNow:24*60*60];
    NSLog(@"date3:%@",date3);
    
    NSDate *date4=[NSDate dateWithTimeIntervalSinceNow:-24*60*60];
    NSLog(@"date4:%@",date4);
    
    //时间戳：某一日期到1970年的秒数大小，称为该日期的时间戳
    NSDate *date1970=[NSDate dateWithTimeIntervalSince1970:0];
    NSLog(@"date1970:%@",date1970);
    
    NSDate *time=[NSDate dateWithTimeIntervalSince1970:13435354];
    NSLog(@"time:%@",time);
    
    //获取日期的时间戳
    NSDate *timeNow=[NSDate date];
    NSTimeInterval v1=[timeNow timeIntervalSince1970];
    NSLog(@"v1=%f",v1);
    
    NSTimeInterval v2=[time timeIntervalSinceNow];
    NSLog(@"v2=%f",v2);
    
    //3.日期比较
    //(1)通过日期对象的compare方法进行比较
    NSComparisonResult *result=[date3 compare:date2];
    if (result==NSOrderedAscending) {
        NSLog(@"date3<date2");
    }else if (result==NSOrderedDescending){
        NSLog(@"date3>date2");
    }
    //（2）通过时间戳比较
    if([date3 timeIntervalSince1970]>[date2 timeIntervalSince1970]){
        NSLog(@"date3>date2");
    }
    
    //NSDateFormatter
    //2013-12-15 08:08:26 +0000
    //2013年12月15日 08时08很26秒
    //2013/12/15
    
    //1.日期对象-->字符串
    NSDate *nowDate=[NSDate date];
//    NSString *timestr=nowDate.description;
//    NSLog(@"%@",timestr);
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    //设置输出日期格式
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH时mm分ss秒 zz"];
    NSString *datestring1=[dateFormatter stringFromDate:nowDate];
    NSLog(@"格式化后1:%@",datestring1);
    //设置时区
    //创建时区对象
    NSTimeZone *timezone=[NSTimeZone timeZoneWithName:@"America/New_York"];
    //将时区配置给dateFormatter对象
    [dateFormatter setTimeZone:timezone];
     NSString *datestring2=[dateFormatter stringFromDate:nowDate];
     NSLog(@"格式化后1:%@",datestring2);
    //获取到所有时区的名称
    NSArray *zoneNames=[NSTimeZone knownTimeZoneNames];
    for (NSString *zoneName in zoneNames) {
        NSLog(@"%@",zoneName);
    }
    
    //2.字符串格式化成日期对象
    //字符串-->日期队形
    NSString *str=@"2013年12月15日 16:31:08";
    NSDateFormatter *dateFormatter2=[[NSDateFormatter alloc]init];
    [dateFormatter2 setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    NSDate *date=[dateFormatter2 dateFromString:str];
    NSLog(@"%@",date);
    
    
    return 0;
}
