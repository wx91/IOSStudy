//
//  RootViewController.m
//  2.Hello World_Code
//
//  Created by wangx on 15/7/15.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)runThread{
    @autoreleasepool {
        [NSTimer scheduledTimerWithTimeInterval:1 target:self
                                       selector:@selector(timeAction) userInfo:nil repeats:YES];
        //开启RunLoop来使线程保持存活状态
        [[NSRunLoop currentRunLoop]run];
    }
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
