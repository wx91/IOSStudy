//
//  MyCell.h
//  8.1CustomCellDemo
//
//  Created by wangx on 15/6/21.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell{
@private
    UILabel *_label;
}


@property(nonatomic,retain)NSString *text;

-(void)initSubViews;

@end
