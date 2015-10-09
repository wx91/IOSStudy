//
//  MainViewController.m
//  15.3 SystemSoundDemo
//
//  Created by wangx on 15/7/2.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "MainViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playAction:(UIButton *)sender {
//    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"44th Street Medium" ofType:@"caf"];
//    NSURL *url=[NSURL fileURLWithPath:filePath];
//    
//    SystemSoundID soundId;
//    //将URL所在的音频文件注册为系统声音，soundID音频ID来标示
//    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundId);
//    //播放系统声音
//    AudioServicesPlayAlertSound(soundId);
    
    //播放震动
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
