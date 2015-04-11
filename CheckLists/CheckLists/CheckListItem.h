//
//  CheckListItem.h
//  CheckLists
//
//  Created by wangx on 15/3/31.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//
#import <Foundation/Foundation.h>
@interface CheckListItem : NSObject<NSCoding>
    @property(nonatomic,copy)NSString *text;
    @property(nonatomic,assign)BOOL checked;
    -(void)toggleChecked;

@end