//
//  ViewController.m
//  XMLTest1
//
//  Created by wangx on 15/5/11.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)start{
    NSString *path=[[NSBundle mainBundle]pathForResource:@"Notes" ofType:@"xml"];
    NSURL *url=[NSURL fileURLWithPath:path];
    
    //开始解析
    NSXMLParser *parser=[[NSXMLParser alloc]initWithContentsOfURL:url];
    parser.delegate=self;
    [parser parse];
    NSLog(@"解析搞定！");
}
//文档开始时触发，开始解析时，只触发一次
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    _notes=[NSMutableArray new];
}
//文档出错时触发
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"%@",parseError);
}

//遇到一个开始标签时触发
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    //把element赋值给成员变量tag
    _tag=elementName;
    //如果名字是user就取出ID
    if ([elementName isEqualToString:@"user"]) {
        NSString *id=[attributeDict objectForKey:@"userId"];
        
    }
}


- (IBAction)loadXML:(id)sender {
}

- (IBAction)parseXML:(id)sender {
}

@end
