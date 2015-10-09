//
//  AppDelegate.h
//  16.6 ASIHttpDemo
//
//  Created by wangx on 15/7/5.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASINetworkQueue.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,retain)ASINetworkQueue *queue;


@end

