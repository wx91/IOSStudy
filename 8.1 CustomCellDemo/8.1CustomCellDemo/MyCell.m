//
//  MyCell.m
//  8.1CustomCellDemo
//
//  Created by wangx on 15/6/21.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}
//布局其他的子视图
-(void)layoutSubviews{
    [super layoutSubviews];
    _label.frame=CGRectMake(80, 0, 160, 80);
    _label.text=self.text;
    
}

-(void)initSubViews{
    _label=[[UILabel alloc]initWithFrame:CGRectZero];
    _label.backgroundColor=[UIColor yellowColor];
    
    [self.contentView addSubview:_label];
}
@end
