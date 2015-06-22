//
//  SubView.m
//  2.UIViewDemo
//
//  Created by wangx on 15/6/13.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "SubView.h"

@implementation SubView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        _otherView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        _otherView.backgroundColor=[UIColor yellowColor];
        [self addSubview:_otherView];
        
    }
    return self;
}

@end
