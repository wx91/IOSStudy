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
    //播放远程地址
//    NSString *mp3Url=@"http://lx.cdn.baidupcs.com/file/cf8322cdcb39e88858004b60d5c352f1?bkt=p2-qd-87&xcode=afb775cf7d7731dcd3eac6fab508ed2059b31098fd35136f97b9a5605f7129c8&fid=1565275458-250528-959804607009145&time=1435823493&sign=FDTAXERLBH-DCb740ccc5511e5e8fedcff06b081203-SZG7BnK9b8d%2FE2SfXDubxYzwGsg%3D&to=sc&fm=Nan,B,T,t&sta_dx=3&sta_cs=162&sta_ft=mp3&sta_ct=6&fm2=Nanjing,B,T,t&newver=1&newfm=1&secfm=1&flow_ver=3&sl=67567695&expires=8h&rt=sh&r=636530007&mlogid=3561417049&vuk=3157594595&vbdid=2151248338&fin=%E6%B1%9F%E5%8D%97style.mp3&fn=%E6%B1%9F%E5%8D%97style.mp3&slt=pm&uta=0&rtype=1&iv=0";
//    NSURL *url=[NSURL URLWithString:mp3Url];
//    audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
//    [audioPlayer play];
//    NSURL *url=[NSURL URLWithString:mp3Url];
    //播放本地文件
//    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"遇见" ofType:@"mp3"];
//    NSURL *url=[NSURL fileURLWithPath:filePath];
//    AVPlayer *player=[[AVPlayer alloc]initWithURL:url];
//    [player play];
    
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"遇见" ofType:@"mp3"];
    NSURL *url=[NSURL fileURLWithPath:filePath];
    audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    [audioPlayer play];
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
