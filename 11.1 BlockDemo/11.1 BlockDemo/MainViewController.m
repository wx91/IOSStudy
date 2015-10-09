//
//  MainViewController.m
//  11.1 BlockDemo
//
//  Created by wangx on 15/6/30.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "MainViewController.h"

//声明一个block类型
typedef int(^MyBlock)(int);

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //声明
//    int (^myBlock)(int);
//    //创建block
//    myBlock=^(int a){
//        NSLog(@"参数：%d",a);
//        return 10;
//    };
//    //调用block,方才去执行myblock中的内容
//    int ret=myBlock(20);
//    NSLog(@"%d",ret);
//    MyBlock myblock=^(int a){
//        NSLog(@"参数：%d",a);
//        return 20;
//    };
//    myblock(10);
//    MyBlock myblock=^(int a){
//        NSLog(@"这是Block代码块a=%d",a);
//        return 10;
//    };
//    [self testBlock:myblock];
    
    
//    __block int number=20;
//    MyBlock myblock2=^(int a){
//        number=30;
//        number++;
//        NSLog(@"%d",number);
//        return 10;
//    };
//    number=30;
//    myblock2(10);

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//block作为函数参数的时候
//-(void)test:(int (^)(int))myBlock{
//    
//}

//-(void)test:(MyBlock )myblock{
//    
//}

-(void)testBlock:(MyBlock )myblock{
    //block的回调
    myblock(10);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
