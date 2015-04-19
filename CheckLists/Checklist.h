//
//  Checklist.h
//  CheckLists
//
//  Created by wangx on 15/4/12.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject<NSCoding>

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *iconName;

@property(nonatomic,strong)NSMutableArray *items;

-(int)countUncheckedItems;

-(NSComparisonResult)compareChecklist:(Checklist *)otherChecklist;

@end
