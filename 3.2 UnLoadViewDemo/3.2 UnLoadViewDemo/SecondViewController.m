//
//  SecondViewController.m
//  3.2 UnLoadViewDemo
//
//  Created by wangx on 15/6/22.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "SecondViewController.h"
#import "Other.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Second";
    }
    return self;
}

-(void)loadView{
    UIView *baseView=[[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    baseView.backgroundColor=[UIColor yellowColor];
    self.view=baseView;
    
    _subView2=[[UIView alloc]initWithFrame:CGRectMake(60, 100, 200, 200)];
    _subView2.backgroundColor=[UIColor blueColor];
    [self.view addSubview:_subView2];
    
    Other *otherView=[[Other alloc]initWithFrame:CGRectMake(110, 350, 100, 100)];
    otherView.backgroundColor=[UIColor brownColor];
    [self.view addSubview:otherView];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //其中viewWillUnload和viewDidUnload在 5之后弃用，采用didReceiveMemoryWarning方法来处理
    //拿到应用程序的窗口
//    [[UIApplication sharedApplication].keyWindow ];
    //当前的视图控制器中的视图不在当前窗口
    if([self.view window]==nil){
        self.subView2=nil;
        self.view=nil;
    }
    
}
// 视图控制器的视图将要卸载
-(void)viewWillUnload{
    [super viewWillUnload];
    NSLog(@"%s",__FUNCTION__);
}
// 视图控制器的视图已经卸载，需要卸载掉其他的子视图（强引用）
-(void)viewDidUnload{
    [super viewDidUnload];
//    NSLog(@"%@",self.view);//self.view->nil getter方法
    self.subView2=nil;
    NSLog(@"%s",__FUNCTION__);
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
