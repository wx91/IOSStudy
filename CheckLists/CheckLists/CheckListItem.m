//
//  CheckListItem.m
//  CheckLists
//
//  Created by wangx on 15/3/31.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckListItem.h"
@implementation CheckListItem

//解码归档数据来初始化对象
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    if (self!=nil) {
        //把解码归档的对象中Key为Text的设置为对象的text
        self.text=[aDecoder decodeObjectForKey:@"Text"];
        //把解码归档的对象中Key为Checked的设置为对象的check
        self.checked=[aDecoder decodeBoolForKey:@"Checked"];
    }
    return self;
}

//对象的属性数据做编码处理
-(void) encodeWithCoder:(NSCoder *)aCoder{
    //把对象中self.text归档设置它的Key为Text
    [aCoder encodeObject:self.text forKey:@"Text"];
    //把对象中self.checked归档设置它的Key为Checked
    [aCoder encodeBool:self.checked forKey:@"Checked"];
}

//切换事务是否选择
-(void)toggleChecked{
    self.checked=!self.checked;
}

@end
