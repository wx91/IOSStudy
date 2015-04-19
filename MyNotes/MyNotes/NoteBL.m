//
//  NoteBL.m
//  MyNotes
//
//  Created by wangx on 15/4/19.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "NoteBL.h"
#import "NoteDAO.h"

@implementation NoteBL
//插入备忘录的方法
-(NSMutableArray *)createNote:(Note *)model{
    NoteDAO *dao=[NoteDAO shareManager];
    [dao create:model];
    return [dao findAll];
}

//删除备忘录方法
-(NSMutableArray *)remove:(Note *)model{
    NoteDAO *dao=[NoteDAO shareManager];
    [dao remove:model];
    return [dao findAll];
}

//查询所有数据的方法
-(NSMutableArray *)findAll{
    NoteDAO *dao =[NoteDAO shareManager];
    return [dao findAll];
}

@end
