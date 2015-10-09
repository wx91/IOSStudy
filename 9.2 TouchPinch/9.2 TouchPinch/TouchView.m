//
//  TouchView.m
//  9.2 TouchPinch
//
//  Created by wangx on 15/6/27.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.multipleTouchEnabled=YES;
    }
    return  self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([touches count]==2) {
        NSArray *touchArray=[touches allObjects];
        UITouch *firstTouch=[touchArray objectAtIndex:0];
        UITouch *secondTouch=[touchArray objectAtIndex:1];
        
        CGPoint point1=[firstTouch locationInView:self];
        CGPoint point2=[secondTouch locationInView:self];
        
        double dinstance=[self distance:point1 point:point2];
        NSLog(@"%f",dinstance);
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([touches count]==2) {
        NSArray *touchArray=[touches allObjects];
        UITouch *firstTouch=[touchArray objectAtIndex:0];
        UITouch *secondTouch=[touchArray objectAtIndex:1];
        
        CGPoint point1=[firstTouch locationInView:self];
        CGPoint point2=[secondTouch locationInView:self];
        //当前两个点的距离
        double dinstance=[self distance:point1 point:point2];
        
        float subValue=dinstance-lastValue;
        if (subValue>0){
            NSLog(@"放大捏合");
        }else{
            NSLog(@"缩小捏合");
        }
        lastValue=dinstance;
        
    }
}

-(double)distance:(CGPoint )p1 point:(CGPoint )p2{
    double dinstance=sqrt(pow(p1.x-p2.x, 2)+pow(p1.y-p2.y, 2));
    return dinstance;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
