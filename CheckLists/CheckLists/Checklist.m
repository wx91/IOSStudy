//
//  Checklist.m
//  CheckLists
//
//  Created by wangx on 15/4/12.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Checklist.h"
#import "CheckListItem.h"

@implementation Checklist
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
-(int)countUncheckedItems{
    int count=0;
    for(CheckListItem *item in self.items){
        if (!item.checked) {
            count+=1;
        }
    }
    return count;
}

-(NSComparisonResult)compareChecklist:(Checklist *)otherChecklist{
    return [self.name localizedStandardCompare:otherChecklist.name];
}

@end
