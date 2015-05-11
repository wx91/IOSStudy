//
//  UserXMLParser.m
//  XMLTest1
//
//  Created by wangx on 15/5/11.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "UserXMLParser.h"

@implementation UserXMLParser

-(void)start{
    NSString *path=[[NSBundle mainBundle]pathForResource:@"user" ofType:@"xml"];
    NSURL *url=[NSURL fileURLWithPath:path];
    
    NSXMLParser *parser=[[NSXMLParser alloc]initWithContentsOfURL:url];
    parser.delegate=self;
    [parser parse];
    NSLog(@"开始解析");
}

//文档开始触发时，开始解析，只触发一次
-(void) parserDidStartDocument:(NSXMLParser *)parser{
    _users=[[NSMutableArray alloc]init];
}
//文档解析出错
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"%@",parseError);
}
//遇到第一个标签开始触发
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    //把element赋值给成员变量currentTagName
    _currentTagName=elementName;
    //如果名字是users就取出id
    if (_currentTagName isEqualToString:@"users") {
        
    }
    
}

@end
