//
//  Checklist.h
//  Checklists
//
//  Created by wangx on 15/5/30.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject

@property(nonatomic,copy)NSString *name;

@property(nonatomic,strong)NSMutableArray *items;

@property(nonatomic,copy)NSString *iconName;

-(int)countUncheckItems;

@end
