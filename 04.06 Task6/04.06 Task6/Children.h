//
//  Children.h
//  04.06 Task6
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Children;

@protocol ChildrenDelegate <NSObject>
@required
//照顾小孩的协议
-(void)wash:(Children *)children;
//帮小孩洗澡
-(void)play:(Children *)children;

@end

@interface Children : NSObject{
    int *timeValue;
//    Nure *_nure;  //保姆
//    Nanny *_nanny;
    id<ChildrenDelegate> _delegate;
    
}

//-(void)setNure:(Nure *)nure;

//-(void)setNanny:(Nanny *)nanny;

-(void)setDelegate:(id<ChildrenDelegate>)delegate;

@end
