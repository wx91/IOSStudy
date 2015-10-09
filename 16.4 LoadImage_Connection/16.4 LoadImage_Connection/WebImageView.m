//
//  WebImageView.m
//  16.4 LoadImage_Connection
//
//  Created by wangx on 15/7/4.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "WebImageView.h"

@implementation WebImageView


-(void)setURL:(NSURL *)url{
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init];
    [request setHTTPMethod:@"GET"];
    [request setURL:url];
    [request setTimeoutInterval:60];
    
    self.data=[NSMutableData data];
    NSURLConnection *connection=[NSURLConnection connectionWithRequest:request delegate:self];
    //异步请求可以取消。
//    [connection cancel];
}

#pragma mark -NSURLConnectionDataDelegate
//主线程调用
//数据加载过程中调用
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.data appendData:data];
}
//数据加载完成后调用
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    UIImage *image=[UIImage imageWithData:self.data];
    self.image=image;
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"请求网络失败:%@",error);
}

@end
