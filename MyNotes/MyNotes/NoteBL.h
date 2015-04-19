//
//  NoteBL.h
//  MyNotes
//
//  Created by wangx on 15/4/19.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"
@interface NoteBL : NSObject

//插入备忘录的方法
-(NSMutableArray *)createNote:(Note *)model;

//删除备忘录方法
-(NSMutableArray *)remove:(Note *)model;

//查询所有数据的方法
-(NSMutableArray *)findAll;


@end
