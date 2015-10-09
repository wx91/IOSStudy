//
//  WXRequest.m
//  16.5 WXDataServer
//
//  Created by wangx on 15/7/4.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "WXRequest.h"

@implementation WXRequest


-(void)startAsynrc{
    self.data=[NSMutableData data];
    
    //发送异步请求
    self.connection=[NSURLConnection connectionWithRequest:self delegate:self];
}
-(void)cancel{
    [self.connection cancel];
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.data appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    self.block(self.data);
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"请求网络出错!%@",error);
}

@end
