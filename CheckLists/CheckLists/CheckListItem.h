//
//  CheckListItem.h
//  CheckLists
//
//  Created by wangx on 15/3/31.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//
#import <Foundation/Foundation.h>
@interface CheckListItem : NSObject<NSCoding>
    //该类的属性，text为名称
    @property(nonatomic,copy)NSString *text;
    //该类的属性，表示是否被选择
    @property(nonatomic,assign)BOOL checked;
    //选项切换,
    -(void)toggleChecked;

@end