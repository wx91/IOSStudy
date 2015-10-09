//
//  ImageScrollView.h
//  10.1 ScrollViewPropertyDemo
//
//  Created by wangx on 15/6/29.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageScrollView : UIScrollView<UIScrollViewDelegate>{
    @private
    UIImageView *_imageView;
}
@property(nonatomic,readonly,retain) UIImageView *imageView;

@end
