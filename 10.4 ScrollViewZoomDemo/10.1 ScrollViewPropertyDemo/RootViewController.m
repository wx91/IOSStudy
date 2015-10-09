//
//  RootViewController.m
//  10.1 ScrollViewPropertyDemo
//
//  Created by wangx on 15/6/28.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

-(void)loadView{
    [super loadView];
    scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    scrollView.backgroundColor=[UIColor clearColor];
    
//    是否支持滑动到最顶端
//    scrollView.scrollsToTop=NO;
    scrollView.delegate=self;
    //设置内容大小
    scrollView.contentSize=CGSizeMake(320, 460);
    scrollView.minimumZoomScale=0.5;
    scrollView.maximumZoomScale=2;
    //缩放时是否存在一个反弹的效果
//    scrollView.isZoomBouncing=YES;
    
    [self.view addSubview:scrollView];
    
    _imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    _imageView.image=[UIImage imageNamed:@"1.jpg"];
    [scrollView addSubview:_imageView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIScrollView Delegate
//返回一个放大或者缩小的视图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView; {
    return _imageView;
}
//开始放大或缩小
-(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    NSLog(@"scrollViewWillBeginZooming");
}


//缩放结束时
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    NSLog(@"scrollViewDidEndZooming");
}
//视图已经放大或说缩小
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidZoom");
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
