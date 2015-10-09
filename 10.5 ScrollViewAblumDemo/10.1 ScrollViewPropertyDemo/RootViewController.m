//
//  RootViewController.m
//  10.1 ScrollViewPropertyDemo
//
//  Created by wangx on 15/6/28.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "RootViewController.h"
#import "ImageScrollView.h"

@implementation RootViewController

-(void)loadView{
    [super loadView];
    //base ScrollView
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 340, 460)];
    _scrollView.backgroundColor=[UIColor blackColor];
    _scrollView.delegate=self;
    _scrollView.pagingEnabled=YES;
    _scrollView.tag=INT_MAX;
    _scrollView.showsHorizontalScrollIndicator=NO;
    //设置内容大小
    _scrollView.contentSize=CGSizeMake(340*4, 460);
    [self.view addSubview:_scrollView];
    
    int _x=0;
    for (int index=0; index<5; index++) {
        ImageScrollView *imgScrollView=[[ImageScrollView alloc]initWithFrame:CGRectMake(0+_x, 0, 320, 460)];
        imgScrollView.tag=index;
        NSString *imgName=[NSString stringWithFormat:@"%d.JPG",index+1];
        imgScrollView.imageView.image=[UIImage imageNamed:imgName];
        
        [_scrollView addSubview:imgScrollView];
        _x+=340;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIScrollView Delegate
int pre=0;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int current=scrollView.contentOffset.x/340;
    ImageScrollView *imgScrollView=(ImageScrollView *)[scrollView viewWithTag:pre];
    if (current !=pre &&imgScrollView.zoomScale>1) {
        imgScrollView.zoomScale=1;
    }
    pre=current;
}


/*
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
*/


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
