//
//  UserXMLParser.h
//  XMLTest1
//
//  Created by wangx on 15/5/11.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserXMLParser : NSObject<NSXMLParserDelegate>

@property(strong,nonatomic)NSMutableArray *users;

@property(strong,nonatomic)NSString *currentTagName;

-(void)start;

@end
