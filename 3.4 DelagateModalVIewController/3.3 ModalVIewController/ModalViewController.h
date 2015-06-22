//
//  ModalViewController.h
//  3.3 ModalVIewController
//
//  Created by wangx on 15/6/22.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalViewControllerDelegate <NSObject>

@optional

-(void)changeLabelText:(NSString *)text;

@end

@interface ModalViewController : UIViewController{
    @private
    UITextField *_textField;
}

@property(nonatomic,assign)id<ModalViewControllerDelegate> delegate;

@end
