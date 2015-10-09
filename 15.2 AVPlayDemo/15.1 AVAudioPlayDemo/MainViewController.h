//
//  MainViewController.h
//  15.1 AVAudioPlayDemo
//
//  Created by wangx on 15/7/2.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface MainViewController : UIViewController<AVAudioPlayerDelegate>{
    AVAudioPlayer *audioPlayer;
}
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UISlider *currentSlider;

- (IBAction)volumeAction:(UISlider *)sender;

- (IBAction)currentAction:(UISlider *)sender;

- (IBAction)playAction:(UIButton *)sender;

@end
