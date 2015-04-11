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

-(void)toggleChecked{
    self.checked=!self.checked;
}
-(void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.text forKey:@"Text"];
    [aCoder encodeBool:self.checked forKey:@"Checked"];
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super init]) {
        self.text=[aDecoder decodeObjectForKey:@"Text"];
        self.checked=[aDecoder decodeBoolForKey:@"Checked"];
    }
    return self;
}


@end
