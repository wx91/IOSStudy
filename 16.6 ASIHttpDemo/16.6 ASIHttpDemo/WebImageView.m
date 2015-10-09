//
//  WebImageView.m
//  16.6 ASIHttpDemo
//
//  Created by wangx on 15/7/5.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "WebImageView.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"
@implementation WebImageView

-(void)setImageURL:(NSURL *)url{
    //同步请求
    [self asynchronous:url];
}
//异步请求
-(void)asynchronous:(NSURL *)url{
//    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:60];
    //开始异步网络请求
    [request startAsynchronous];
    
    //POST请求
    //username=wxhl&password=123456
    //向请求体中设置参数
//    [request addPostValue:@"wxhl" forKey:@"username"];
    
    
    //设置代理
//    request.delegate=self;
    //发送异步请求
    [request startAsynchronous];
    //设置网络请求完成后的block

    [request setCompletionBlock:^{
        NSData *data=request.responseData;
        self.image=[UIImage imageWithData:data];
        //判断数据的来源是网络还是本地缓存
        if (request.didUseCachedResponse) {
            NSLog(@"数据来自缓存");
        }else{
            NSLog(@"数据来自于网络");
        }
    }];
    //请求失败调用
    [request setFailedBlock:^{
        NSError *error=request.error;
        NSLog(@"请求网络出错%@",error);
    }];
    //缓存设置
    NSString *cachePath=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    ASIDownloadCache *cache=[[ASIDownloadCache alloc]init];
    [cache setStoragePath:cachePath];
    cache.defaultCachePolicy=ASIOnlyLoadIfNotCachedCachePolicy;
    //每次启动时，会将上次的缓存文件清除
//    request.cacheStoragePolicy=ASICacheForSessionDurationCacheStoragePolicy;
    //持久缓存，一直保存在本地
    request.cacheStoragePolicy=ASICachePermanentlyCacheStoragePolicy;
    request.downloadCache=cache;
    //创建数据请求对象
    
    
}
#pragma mark ASIHTTPRequest delegate
//请求完成
- (void)requestFinished:(ASIHTTPRequest *)request{
    NSData *data=request.responseData;
    self.image=[UIImage imageWithData:data];
}
//请求失败
- (void)requestFailed:(ASIHTTPRequest *)request{
    NSError *error=request.error;
    NSLog(@"请求网络出错%@",error);
}

//同步请求
-(void)synchronous:(NSURL *)url{
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:60];
    //发送异步请求
    [request startAsynchronous];
    NSError *error=request.error;
    if (error==nil) {
        //获取请求的数据
        NSData *data=request.responseData;
        UIImage *image=[UIImage imageWithData:data];
        self.image=image;
    }else{
        NSLog(@"请求出错!%@",error);
    }
    //设置请求头
    //    [request setRequestHeaders:<#(NSMutableDictionary *)#>]
    //设置cookies
    //    [request setRequestCookies:<#(NSMutableArray *)#>]
}



@end
