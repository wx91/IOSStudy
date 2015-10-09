//
//  MainViewController.m
//  15.1 AVAudioPlayDemo
//
//  Created by wangx on 15/7/2.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "MainViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *error;
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error];
    
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"遇见" ofType:@"mp3"];
    NSURL *url=[NSURL fileURLWithPath:filePath];
    audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    audioPlayer.delegate=self;
    //准备播放
    [audioPlayer prepareToPlay];
//    if([audioPlayer play]){
//        NSLog(@"开始播放音乐了！");
//    }
    _volumeSlider.minimumValue=0;
    _volumeSlider.maximumValue=1;

    
    _currentSlider.minimumValue=0;
    _currentSlider.maximumValue=audioPlayer.duration;
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    
}
-(void)timeAction:(NSTimer *)timer{
    if (audioPlayer.playing) {
        NSString *current=[NSString stringWithFormat:@"%.0f",audioPlayer.currentTime];
        _timeLabel.text=current;
        _currentSlider.value=audioPlayer.currentTime;
    }
}
- (IBAction)volumeAction:(UISlider *)sender {
    //设置播放音量
    audioPlayer.volume=sender.value;
}


- (IBAction)currentAction:(UISlider *)sender {
    //设置当前的播放进度时间
    audioPlayer.currentTime=sender.value;
}

- (IBAction)playAction:(UIButton *)sender {
    //播放器是正在播放
    BOOL playing=audioPlayer.playing;
    if (playing) {//正在播放
        [audioPlayer pause];
        [sender setTitle:@"播放" forState:UIControlStateNormal];
    }else{
        [audioPlayer play];
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
    }
}

#pragma  mark AVAudioPlayer delegate
//播放结束
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    NSLog(@"播放结束");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
