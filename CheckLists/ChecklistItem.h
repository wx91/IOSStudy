//
//  CheckListItem.h
//  CheckLists
//
//  Created by wangx on 15/3/31.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//
#import <Foundation/Foundation.h>
@interface ChecklistItem : NSObject<NSCoding>
//该类的属性，text为名称
@property(nonatomic,copy)NSString *text;
//该类的属性，表示是否被选择
@property(nonatomic,assign)BOOL checked;
//截止日期
@property (nonatomic,copy)NSDate *dueDate;
//是否需要被提醒
@property(nonatomic,assign)BOOL shouldRemind;
//item的唯一标示
@property(nonatomic,assign)NSInteger itemId;

//选项切换,
-(void)toggleChecked;

@end