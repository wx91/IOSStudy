//
//  WXDataService.m
//  16.5 WXDataServer
//
//  Created by wangx on 15/7/4.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "WXDataService.h"
#import "WXRequest.h"

#define BASE_URL @"http://www.weather.com.cn/data/sk/"
//http://www.weather.com.cn/adat/sk/101010300.html
@implementation WXDataService

+(void)getWeatherData:(NSDictionary *)params block:(Completion *)block{
    
    NSString *cityCode=[params objectForKey:@"code"];
    NSString *urlstring=[BASE_URL stringByAppendingFormat:@"%@.html",cityCode];
//    [self startRequest:params url:urlstring block:block];

}

+(void)startRequest:(NSDictionary *)params
                url:(NSString *)urlstring
              block:(Completion)block{
    WXRequest *request=[WXRequest requestWithURL:[NSURL URLWithString:urlstring]];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:60];
    request.block=^(NSData *data){
        NSString *dataString=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",dataString);
        id result=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        block(result);
    };
    
    [request startAsynrc];
}


@end
