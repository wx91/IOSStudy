//
//  CheckListItem.m
//  CheckLists
//
//  Created by wangx on 15/3/31.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "DataModel.h"
#import "ChecklistItem.h"

@implementation ChecklistItem
-(instancetype)init{
    self=[super init];
    if (self!=nil) {
        self.itemId=[DataModel nextChecklistItemId];
    }
    return self;
}

//解码归档数据来初始化对象
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    if (self!=nil) {
        //把解码归档的对象中Key为Text的设置为对象的text
        self.text=[aDecoder decodeObjectForKey:@"Text"];
        //把解码归档的对象中Key为Checked的设置为对象的check
        self.checked=[aDecoder decodeBoolForKey:@"Checked"];
        self.dueDate=[aDecoder decodeObjectForKey:@"DueDate"];
        self.shouldRemind=[aDecoder decodeBoolForKey:@"ShouldRemind"];
        self.itemId=[aDecoder decodeIntegerForKey:@"ItemID"];
    }
    return self;
}

//对象的属性数据做编码处理
-(void) encodeWithCoder:(NSCoder *)aCoder{
    //把对象中self.text归档设置它的Key为Text
    [aCoder encodeObject:self.text forKey:@"Text"];
    //把对象中self.checked归档设置它的Key为Checked
    [aCoder encodeBool:self.checked forKey:@"Checked"];
    [aCoder encodeObject:self.dueDate forKey:@"DueDate"];
    [aCoder encodeBool:self.shouldRemind forKey:@"ShouldRemind"];
    [aCoder encodeInteger:self.itemId forKey:@"ItemID"];
}

//切换事务是否选择
-(void)toggleChecked{
    self.checked=!self.checked;
}
-(UILocalNotification *)notificationForThisItem{
    NSArray *allNotifications=[[UIApplication sharedApplication]scheduledLocalNotifications];
    for (UILocalNotification *notification in allNotifications) {
        NSNumber *number=[notification.userInfo objectForKey:@"ItemID"];
        if (number!=nil&&[number integerValue]==self.itemId) {
            return notification;
        }
    }
    return  nil;
}

-(void)scheduleNotification{
    UILocalNotification *existingNotification=[self notificationForThisItem];
    if(existingNotification!=nil){
        NSLog(@"Found an Exisint notifaction %@",existingNotification);
        [[UIApplication sharedApplication]cancelLocalNotification:existingNotification];
    }
    
    if(self.shouldRemind&&
         [self.dueDate compare:[NSDate date]]!=NSOrderedAscending) {
        UILocalNotification *localNotification = [[UILocalNotification alloc]init];
        localNotification.fireDate=self.dueDate;
        localNotification.timeZone=[NSTimeZone defaultTimeZone];
        localNotification.alertBody=self.text;
        localNotification.soundName=UILocalNotificationDefaultSoundName;
        localNotification.userInfo=@{@"ItemID":@(self.itemId)};
        [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
        NSLog(@"Scheduled notification %@ for ItemId %ld",localNotification,(long)self.itemId);
    }
}
-(void)dealloc{
    UILocalNotification *existingNotification=[self notificationForThisItem];
    if(existingNotification!=nil){
        NSLog(@"Removing exisint notification %@",existingNotification);
        [[UIApplication sharedApplication]cancelLocalNotification:existingNotification];
    }
}

@end
