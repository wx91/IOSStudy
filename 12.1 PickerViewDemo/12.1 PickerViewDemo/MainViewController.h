//
//  MainViewController.h
//  12.1 PickerViewDemo
//
//  Created by wangx on 15/6/30.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSArray *data;
}

@end
