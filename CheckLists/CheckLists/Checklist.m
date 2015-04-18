//
//  Checklist.m
//  CheckLists
//
//  Created by wangx on 15/4/12.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Checklist.h"
#import "ChecklistItem.h"

@implementation Checklist
/**
 *  @author wangx, 15-04-18 11:04:55
 *
 *  初始化方法
 *
 *  @return 返回checklist的对象
 */
-(instancetype)init{
    self=[super init];
    if (self) {
        self.items=[[NSMutableArray alloc]initWithCapacity:20];
        self.iconName=@"No Icon";
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.name=[coder decodeObjectForKey:@"Name"];
        self.name=[coder decodeObjectForKey:@"Items"];
        self.iconName=[coder decodeObjectForKey:@"IconName"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.name forKey:@"Name"];
    [coder encodeObject:self.items forKey:@"Items"];
    [coder encodeObject:self.iconName forKey:@"IconName"];
}
/**
 *  @author wangx, 15-04-18 11:04:09
 *
 *  查询出没有被标记完成的数值
 *
 *  @return 返回没有被标记数值
 */
-(int)countUncheckedItems{
    int count=0;
    for(ChecklistItem *item in self.items){
        if (!item.checked) {
            count+=1;
        }
    }
    return count;
}
/**
 *  @author wangx, 15-04-18 11:04:14
 *
 *  对传入的checklist进行排序
 *
 *  @param otherChecklist 对比的othterChecklist
 *
 *  @return 返回的时对比
 */
-(NSComparisonResult)compareChecklist:(Checklist *)otherChecklist{
    return [self.name localizedStandardCompare:otherChecklist.name];
}

@end
