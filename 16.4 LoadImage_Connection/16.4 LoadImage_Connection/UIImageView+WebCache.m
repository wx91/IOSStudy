//
//  UIImageView+WebCache.m
//  16.4 LoadImage_Connection
//
//  Created by wangx on 15/7/4.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "UIImageView+WebCache.h"

@implementation UIImageView (WebCache)

-(void)setImageWithURL:(NSURL *)url{
    //使用同步请求
//    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init];
//    [request setHTTPMethod:@"GET"];
//    [request setURL:url];
//    [request setTimeoutInterval:60];
//    
//    NSURLResponse *response;
//    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
//    
//    UIImage *image=[UIImage imageWithData:data];
//    self.image=image;
    
    //异步加载请求
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init];
    [request setHTTPMethod:@"GET"];
    [request setURL:url];
    [request setTimeoutInterval:60];
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    //发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        UIImage *image =[UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image=image;
        });
    }];
}


@end
