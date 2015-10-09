//
//  WXRequest.h
//  16.5 WXDataServer
//
//  Created by wangx on 15/7/4.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^FinishLoadBlock)(NSData *);
@interface WXRequest : NSMutableURLRequest<NSURLConnectionDataDelegate>

@property(nonatomic,retain) NSMutableData *data;

@property(nonatomic,retain) NSURLConnection *connection;

@property(nonatomic,copy)FinishLoadBlock block;

//开始异步请求
-(void)startAsynrc;
//取消异步请求
-(void)cancel;

@end
