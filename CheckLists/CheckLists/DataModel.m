//
//  DataModel.m
//  CheckLists
//
//  Created by wangx on 15/4/13.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "DataModel.h"
#import "Checklist.h"

@implementation DataModel

-(instancetype)init{
    self=[super init];
    if(self){
        [self loadCheckLists];
        [self registerDefaults];
        [self handleFirstTime];
    }
    return  self;
}

-(void)registerDefaults{
    NSDictionary *dictinary=@{@"ChecklistIndex":@-1,@"FirstTime":@YES,@"ChecklistItemId":@0};
    [[NSUserDefaults standardUserDefaults]registerDefaults:dictinary];
    
}

-(void)handleFirstTime{
    BOOL firstTime=[[NSUserDefaults standardUserDefaults]boolForKey:@"FirstTime"];
    if(firstTime){
        Checklist *checklist=[[Checklist alloc]init];
        checklist.name=@"List";
        [self.lists addObject:checklist];
        [self setIndexOfSelectedChecklist:0];
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"FirstTime"];
    }
    
}

-(NSInteger)indexOfSelectedChecklist {
    NSInteger index=[[NSUserDefaults standardUserDefaults]integerForKey:@"ChecklistIndex"];
    return index;
}
-(void)setIndexOfSelectedChecklist:(NSInteger )index {
    [[NSUserDefaults standardUserDefaults]setInteger:index forKey:@"ChecklistIndex"];
    
}
-(void)sortChecklists{
    [self.lists sortUsingSelector:@selector(compareChecklist:)];
}

#pragma mark 获取应用中沙盒的document目录
-(NSString *)doucmentsDirectoy{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory=[paths firstObject];
    return  documentsDirectory;
}
#pragma mark 获取保存文件的整体路径
-(NSString *)dataFilePath{
    return [[self doucmentsDirectoy]stringByAppendingPathComponent:@"Checklists.plist"];
}
#pragma mark 通过code压缩object并保存到对应的文件
-(void) saveChecklists{
    NSMutableData *data=[[NSMutableData alloc]init];
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:_lists forKey:@"CheckLists"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}
#pragma mark 根据文件来加载数据
-(void)loadCheckLists{
    NSString *path=[self dataFilePath];
    if ([[NSFileManager defaultManager]fileExistsAtPath:path]) {
        NSData *data=[[NSData alloc]initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        _lists=[unarchiver decodeObjectForKey:@"CheckLists"];
        [unarchiver finishDecoding];
    }else{
        _lists =[[NSMutableArray alloc]initWithCapacity:20];
    }
}
+(NSInteger)nextChecklistItemId{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSInteger itemId=[userDefaults integerForKey:@"ChecklistItemId"];
    [userDefaults setInteger:itemId+1 forKey:@"ChecklistItemId"];
    [userDefaults synchronize];
    return  itemId;
}

@end
