//
//  NoteDAO.h
//  MyNotes
//
//  Created by wangx on 15/4/19.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"
@interface NoteDAO : NSObject

@property (nonatomic,strong)NSMutableArray *listData;

+(NoteDAO *)shareManager;
//插入备忘录的方法
-(int)create:(Note *)model;
//删除备忘录方法
-(int)remove:(Note *)model
//修改备忘录的方法
-(int)modity:(Note *)model;
//查询所有数据方法
-(NSMutableArray *)findAll;
//按照主键查询数据的方法
-(Note *)findById:(Note *)model;

@end
