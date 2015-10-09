//
//  UIImageView+WebCache.m
//  16.2 LoadImageDemo
//
//  Created by wangx on 15/7/3.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "UIImageView+WebCache.h"

@implementation UIImageView (WebCache)

-(void)setImageWithURL:(NSURL *) url{
    //开启一个多线程，有多线程来加载图片
    dispatch_queue_t queue= dispatch_queue_create("loadImage", NULL);
    dispatch_sync(queue, ^{
        NSData *data=[NSData dataWithContentsOfURL:url];
        UIImage *image=[UIImage imageWithData:data];
        self.image=image;
        //UI的设置一般放在主线程
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            self.image=image;
//        });
    });
    
}
@end
