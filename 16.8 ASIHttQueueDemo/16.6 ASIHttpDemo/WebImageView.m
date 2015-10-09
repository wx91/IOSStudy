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
#import "AppDelegate.h"

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
    //POST请求
    //username=wxhl&password=123456
    //向请求体中设置参数
//    [request addPostValue:@"wxhl" forKey:@"username"];
    //设置代理
//    request.delegate=self;
    
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
    
    //发送异步请求
    [request startAsynchronous];
//    //是否开启后台运行
//    [request setShouldContinueWhenAppEntersBackground:YES];
//    //设置超时自动重试的最大次数
//    [request setNumberOfTimesToRetryOnTimeout:2];
//    //获取cookies
//    NSMutableArray *cookies=[request requestCookies];
//    //清除session
//    [ASIHTTPRequest clearSession];
//    //设置cookies
//    [ASIHTTPRequest setSessionCookies:cookies];
//
//    //当前网络是否可用
//    [ASIHTTPRequest isNetworkInUse];
//    //当前网络是否为3g/2g
//    [ASIHTTPRequest isNetworkReachableViaWWAN];
//    //网络请求时，关闭状态栏上显示的loading
//    [ASIHTTPRequest setShouldUpdateNetworkActivityIndicator:NO];
    
//    AppDelegate *appDelegate=[UIApplication sharedApplication].delegate;
//    [appDelegate.queue addOperation:request];
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
    //发送同步请求
    [request startSynchronous];
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
