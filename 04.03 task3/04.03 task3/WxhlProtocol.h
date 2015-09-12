//
//  WxhlProtocol.h
//  04.03 task3
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WxhlProtocol <NSObject>

@required //必须实现的协议方法,默认是@required
//完成作业的协议方法
-(void)finishTask;

//不能迟到
-(void)dontLate;
//..

@optional   //可选实现的方法
//着装整洁
-(void)wearNeat;



@end
