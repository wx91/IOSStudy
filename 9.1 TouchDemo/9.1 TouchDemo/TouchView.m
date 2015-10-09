//
//  TouchView.m
//  9.1 TouchDemo
//
//  Created by wangx on 15/6/27.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled=YES;
        self.multipleTouchEnabled=YES;
        
        moveView=[[UIView alloc]init];
        moveView.frame=CGRectMake(0, 0, 100, 100);
        moveView.backgroundColor=[UIColor redColor];
        [self addSubview:moveView];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"touchesBegan");
    UITouch *touch=[touches anyObject];
    NSUInteger tapCount=touch.tapCount;
//    NSLog(@"%ld",tapCount);
//    if (tapCount==1l) {
//        [self singleTap];
//        [self performSelector:@selector(singleTap) withObject:nil afterDelay:0.5];
//        
//    }else if(tapCount==2l){
//        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(singleTap) object:nil];
//        [self doubleTap];
//    }
    CGPoint point=[touch locationInView:self];
    NSLog(@"%@",NSStringFromCGPoint(point));
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"touchesMoved");
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self];
    CGRect frame=moveView.frame;
    frame.origin=point;
    moveView.frame=frame;
}
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"touchesEnded");
//}
//-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"touchesCancelled");
//}
- (void)singleTap {
    NSLog(@"单击");
}

- (void)doubleTap {
    NSLog(@"双击");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
