//
//  MainViewController.m
//  MPMoviePlayerDemo
//
//  Created by wangx on 15/7/2.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "MainViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface MainViewController ()

@end

@implementation MainViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playDidChangeNotification:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlstring=@"http://video.weibo.com/show?fid=1034:6c93943a0360eaaf7549ead0fd3371cb";
    NSURL *url=[NSURL URLWithString:urlstring];
    MPMoviePlayerController *moviePlayer=[[MPMoviePlayerController alloc]initWithContentURL:url];
    moviePlayer.view.frame=CGRectMake(0, 0, 320, 200);
    moviePlayer.backgroundView.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:moviePlayer.view];
    [moviePlayer play];
}


-(void)playDidChangeNotification:(NSNotification *)notification{
    MPMoviePlayerController *moviePlayer=notification.object;
    MPMoviePlaybackState  playState=moviePlayer.playbackState;
    NSLog(@"%ld",(long)playState);
    if (playState==MPMoviePlaybackStateStopped) {
        NSLog(@"停止");
    }else if(playState==MPMoviePlaybackStatePlaying){
        NSLog(@"播放");
    }else if(playState==MPMoviePlaybackStatePaused){
        NSLog(@"暂停");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)playAction:(UIButton *)sender {
    NSString *urlstring=@"http://video.weibo.com/show?fid=1034:6c93943a0360eaaf7549ead0fd3371cb";
    NSURL *url=[NSURL URLWithString:urlstring];
    MPMoviePlayerViewController *playerViewController=[[MPMoviePlayerViewController alloc]initWithContentURL:url];
//    [self presentViewController:playerViewController animated:YES completion:NULL];
    [self  presentMoviePlayerViewControllerAnimated:playerViewController];
    
}
@end
