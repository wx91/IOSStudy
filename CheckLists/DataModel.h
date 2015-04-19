//
//  DataModel.h
//  CheckLists
//
//  Created by wangx on 15/4/13.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property(nonatomic,strong)NSMutableArray *lists;

-(void)saveChecklists;

-(NSInteger)indexOfSelectedChecklist;

-(void)setIndexOfSelectedChecklist:(NSInteger )index;

-(void)sortChecklists;

+(NSInteger)nextChecklistItemId;

@end
