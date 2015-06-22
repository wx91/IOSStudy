//
//  DetailViewController.m
//  2.4 AnimationDemo
//
//  Created by wangx on 15/6/21.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

-(void)animationAlpha;

@end

@implementation DetailViewController
@synthesize section=_seciton,row=_row,title=_detailTitle;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
-(void)loadView{
    [super loadView];
    self.view.backgroundColor=[UIColor purpleColor];
    parentView=[[UIView alloc]initWithFrame:CGRectMake(320/2-250/2, 50, 250, 250)];
    parentView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:parentView];
    
    view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 250, 250)];
    view1.backgroundColor=[UIColor redColor];
    [parentView addSubview:view1];
    
    view2=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 250, 250)];
    view2.backgroundColor=[UIColor yellowColor];
    [parentView addSubview:view2];
    
    button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"开始动画" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(animation) forControlEvents:UIControlEventTouchUpInside];
    button.frame=CGRectMake(320/2-60, 350, 120, 40);
    [self.view addSubview:button];
    
    //animation ID作用
    label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    self.navigationItem.titleView=label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animation
{
    if (self.section == 0) {
        
        switch (self.row) {
            case 0:
                [self animationAlpha];
                break;
            case 1:
                [self animationFrame];
                break;
            case 2:
                [self animationTransform];
                break;
            case 3:
                [self animationRotation];
                break;
            case 4:
                [self animationDelegate];
                break;
            case 5:
                [self animationTransition];
                break;
            default:
                [self animationBlock];
                break;
        }
        
    }else {
        
        switch (self.row) {
            case 0:
                [self transition1];
                break;
            case 1:
                [self transition2];
                break;
            case 2:
                [self transition3];
                break;
            case 3:
                [self transition4];
                break;
        }
        
    }
}
#pragma mark UIView动画
-(void)animationAlpha{
    //标志着动画块的开始 第一个参数表示动画的名字，起到标示的作用，第二个参数表示可以一个对象和一个指针
    [UIView beginAnimations:nil context:NULL];//需要设置代理时
    [UIView setAnimationDuration:1];//动画的持续时间
    [UIView setAnimationDelay:1];//动画延迟的时间
    view2.alpha=0.0;
    [UIView commitAnimations];//标志着动画块的结束
}
-(void)animationFrame{
    //标志着动画块的开始 第一个参数表示动画的名字，起到标示的作用，第二个参数表示可以一个对象和一个指针
    [UIView beginAnimations:nil context:NULL];//需要设置代理时
    [UIView setAnimationDuration:5];//动画的持续时间
//    [UIView setAnimationDelay:1];//动画延迟的时间
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];//设置动画的速率
    view2.center=CGPointMake(0, 0);
    [UIView commitAnimations];//标志着动画块的结束
}

- (void)animationTransform
{
    // 标记着动画块的开始 第一个参数表示动画的名字，起到标识的作用，第二个参数表示可以一个对象和一个指针
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1]; // 动画的持续时间
    view2.transform = CGAffineTransformScale(view2.transform, 0.5, 0.5);
    // 标记着动画块的结束
    [UIView commitAnimations];
}

- (void)animationRotation
{
    // 标记着动画块的开始 第一个参数表示动画的名字，起到标识的作用，第二个参数表示可以一个对象和一个指针
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1]; // 动画的持续时间
    view2.transform = CGAffineTransformRotate(view2.transform, M_PI_4); // 旋转控件
    // 标记着动画块的结束
    [UIView commitAnimations];
}
-(void)animationDelegate{
    //这是UIView指定的代理方法
    /*
    NSString *string=@"这是一个字符串";
    [UIView beginAnimations:@"Frame 1 " context:&string];//需要设置代理时
    [UIView setAnimationDuration:1];//动画的持续时间
    [UIView setAnimationDelay:2];//动画延迟的时间
    view1.frame=CGRectMake(0, 300, 250, 250);
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];//标志着动画块的结束
    
    [UIView beginAnimations:@"Frame 2 " context:NULL];
    [UIView setAnimationDuration:1];////动画的持续时间
    view2.frame=CGRectMake(20, 300, 50, 50);
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    */
    //我们指定一个代理方法
    [UIView beginAnimations:@"Frame 3" context:NULL];
    [UIView setAnimationDuration:1];//动画的持续时间
    [UIView setAnimationRepeatCount:9999];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationWillStartSelector:@selector(animationStart)];
    [UIView setAnimationDidStopSelector:@selector(animationStop)];
    view2.frame=CGRectMake(0, 300, 250, 250);
    [UIView commitAnimations];
}

//自定义代理方法
-(void)animationStart{
    button.enabled=NO;
    
}
-(void)animationStop{
    button.enabled=YES;
}

-(void)animationTransition{
    [UIView beginAnimations:@"transition" context:NULL];
    [UIView setAnimationDuration:1];//动画的持续时间
    [UIView setAnimationRepeatCount:10];//执行动画次数
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:parentView cache:YES];//动画效果、基于那个视图执行动画，是否存在缓存
    [parentView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];//更改姿子视图的位置
    [UIView commitAnimations];
}

-(void)animationBlock{
    //block动画1
    [UIView animateWithDuration:1 animations:^(void){
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDelegate:self];
        view2.center=CGPointMake(0, 0);
    }];
    //block动画2
    [UIView animateWithDuration:1 animations:^void{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        view2.center=CGPointMake(0, 0);
    } completion:^(BOOL finished){
        NSLog(@"finished");
    }];
    //block动画3
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionRepeat animations:^(void){
        view1.center=CGPointMake(0, 0);
    }completion:^(BOOL finished){
        NSLog(@"finished");
    }];
    
    //block动画4
    [UIView transitionFromView:view2 toView:view1 duration:2 options:UIViewAnimationOptionTransitionFlipFromBottom completion:^(BOOL finished){
            for (UIView *subView in parentView.subviews) {
                NSLog(@"subView 2:%@",subView);
            }
        }];
}

/////////////////////////
-(void)transition1{
    //实例化一个动画类对象
    CATransition *transition1=[CATransition animation];
    transition1.duration=2;
    //动画速率
    transition1.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //动画的类型
    transition1.type=kCATransitionPush;
    [parentView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    //给视图的层添加动画
    [parentView.layer addAnimation:transition1 forKey:@"transition1"];
}

-(void)transition2{
    //实例化一个动画类对象
    CATransition *transition1=[CATransition animation];
    transition1.duration=2;
    //动画速率
    transition1.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    //动画的类型
    transition1.type=kCATransitionFromTop;
    [parentView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    //给视图的层添加动画
    [parentView.layer addAnimation:transition1 forKey:@"transition2"];
}

-(void)transition3{
    //实例化一个动画类对象
    CATransition *transition1=[CATransition animation];
    transition1.duration=1;
    //动画速率
    transition1.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //动画的类型
    transition1.type=@"cube";
    [parentView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    //给视图的层添加动画
    [parentView.layer addAnimation:transition1 forKey:@"transition3"];
}
-(void)transition4{
    //实例化一个动画类对象
    CATransition *transition1=[CATransition animation];
    transition1.duration=2;
    //动画速率
    transition1.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //动画的类型
    transition1.type=@"pageUnCurl";
    transition1.delegate=self;
    transition1.subtype=kCATransitionFromTop;
    [parentView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    //给视图的层添加动画
    [parentView.layer addAnimation:transition1 forKey:@"transition4"];
}
//当动画开始时
- (void)animationWillStart:(NSString *)animationID context:(void *)context
{
    NSLog(@"animationWillStart : %@", (__bridge NSString *)context);
    if ([animationID isEqualToString:@"Frame 1"]) {
        label.text = @"view1实例开始动画";
    }
} // 当动画开始时

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    NSLog(@"animationDidStop : %d", [finished intValue]);
} // 当动画结束时


////////////////////////////////////////////////////////////////////////////////////

- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"animationDidStart");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"animationDidStop");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
