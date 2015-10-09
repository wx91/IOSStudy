//
//  EditorViewController.h
//  19.2 UserDemo
//
//  Created by wangx on 15/7/7.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
- (IBAction)submitAction:(id)sender;

@end
