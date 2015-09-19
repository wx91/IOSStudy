//
//  Nure.h
//  08.03 Task3
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Children;

@interface Nure : NSObject{
    Children *_children;
}

-(instancetype)initWithChildren:(Children *)children;

@end
