//
//  AppDelegate.h
//  16.7 ASIDownloadFile
//
//  Created by wangx on 15/7/5.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UIProgressView *progressView；
}

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,retain)Reachability *reachability;

@end

