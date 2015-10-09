//
//  ImageScrollView.m
//  10.1 ScrollViewPropertyDemo
//
//  Created by wangx on 15/6/29.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ImageScrollView.h"

@implementation ImageScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        //设置scrollView的属性
        self.maximumZoomScale=2.5;
        self.minimumZoomScale=1;
        
        //添加图片
        _imageView=[[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:_imageView];
        
        //设置代理
        self.delegate=self;
        //添加双击事件
        UITapGestureRecognizer *doubleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(zoomInOrOut:)];
        doubleTap.numberOfTapsRequired=2;
        [self addGestureRecognizer:doubleTap];
        
        
    }
    return self;
}

#pragma  mark UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return  _imageView;
}

-(void)zoomInOrOut:(UITapGestureRecognizer *)tapGuesture{
    if (self.zoomScale>=2.5) {
        [self setZoomScale:1 animated:YES];
    }else{
        CGPoint point=[tapGuesture locationInView:self];
        [self zoomToRect:CGRectMake(point.x-40, point.y-40, 80, 80) animated:YES];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
