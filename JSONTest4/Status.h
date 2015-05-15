//
//  Status.h
//  JSONTest4
//
//  Created by wangx on 15/5/15.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface Status : NSObject

@property(copy,nonatomic)NSString *text;

@property(copy,nonatomic)User *user;

@property(strong,nonatomic) Status *retweetedStatus;


@end
