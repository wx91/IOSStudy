//
//  TouchViewController.m
//  9.4 TouchGuestureDemo
//
//  Created by wangx on 15/6/28.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "TouchViewController.h"

@implementation TouchViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //----------------点击手势------------------
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
    
    UITapGestureRecognizer *doubleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
    doubleTap.numberOfTapsRequired=2;
    [self.view addGestureRecognizer:doubleTap];
    //区分单击和双击手势
    [tap requireGestureRecognizerToFail:doubleTap];
    
    //-------------------轻扫手势
    UISwipeGestureRecognizer *swipGuesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    swipGuesture.direction=UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipGuesture];
    
    //-----------------滑动手势
    UIPanGestureRecognizer *panGesture=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [self.view addGestureRecognizer:panGesture];
    //------长按手势
    UILongPressGestureRecognizer *longPress=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressAction:)];
    [self.view addGestureRecognizer:longPress];
    
    //-----旋转手势
    UIRotationGestureRecognizer *rotation=[[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationAction:)];
    [self.view addGestureRecognizer:rotation];
    
    //-----捏合手势
    UIPinchGestureRecognizer *pinch=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchAction:)];
    [self.view addGestureRecognizer:pinch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)tap:(UITapGestureRecognizer *)tapGetrue {
    NSLog(@"单击");
}

- (void)doubleTap:(UITapGestureRecognizer *)tapGetrue {
    NSLog(@"双击");
}

- (void)swipeAction:(UISwipeGestureRecognizer *)swipeGesture {
    NSLog(@"轻扫");
}

- (void)longPressAction:(UILongPressGestureRecognizer *)longPress {
    if (longPress.state == UIGestureRecognizerStateEnded) {
        return;
    }
    NSLog(@"长按");
}

- (void)panAction:(UIPanGestureRecognizer *)panGesture {
    CGPoint p = [panGesture locationInView:self.view];
    NSLog(@"%@",NSStringFromCGPoint(p));
}

- (void)rotationAction:(UIRotationGestureRecognizer *)rotation {
    //角度
    float degree = rotation.rotation*(180/M_PI);
    NSLog(@"%f",degree);
    
}

- (void)pinchAction:(UIPinchGestureRecognizer *)pinch {
    if (pinch.scale > 0) {
        NSLog(@"放大");
    } else {
        NSLog(@"缩小");
    }
    NSLog(@"%f",pinch.scale);
}
@end
