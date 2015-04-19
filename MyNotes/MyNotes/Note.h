//
//  Note.h
//  MyNotes
//
//  Created by wangx on 15/4/19.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject
@property(nonatomic,strong) NSDate *date;
@property(nonatomic,strong) NSString *content;
@end
