//
//  PlayerViewController.m
//  DouBanMusic
//
//  Created by lkjy on 16/5/6.
//  Copyright © 2016年 lx. All rights reserved.
//

#import "PlayerViewController.h"
#import "PlayerController.h"
#import "ChannelInfo.h"

#import "NetworkManager.h"
#import "ChannelsTableViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "SongInfo.h"
#import "PlayerController.h"
#import "ProtocolClass.h"
@interface PlayerViewController ()<DoubanDelegate>
{
    BOOL isPlaying;//BOOL是否播放
    NSTimer *timer;//定时器
    NSMutableArray* totalTimeString;
}
@property(nonatomic,strong)UILabel *channelTitleLabel;/**<当前频道的标题*/
@property(nonatomic,strong)UIImageView* albumCoverImage;/**<专辑封面*/
@property(nonatomic,strong)UIImageView* albumCoverMaskImage;/**<专辑封面蒙层*/
@property(nonatomic,strong)UIProgressView* timeProgressBar;/**<时间进度条*/
@property(nonatomic,strong)UILabel* timeLabel;/**<显示时间面板*/
@property(nonatomic,strong)UILabel*songTitleLabel;/**<歌曲名*/
@property(nonatomic,strong)UIButton* pauseButton;/**<暂停、播放按钮*/
@property(nonatomic,strong)UIButton *likeButton;/**<收藏按钮*/
@property(nonatomic,strong)UIButton* deleteButton;/**<删除歌曲按钮*/
@property(nonatomic,strong)UIButton* skipButton;/**<跳过播放下首歌曲*/
@end


@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [PlayerController sharedInstance].songInfoDelegate =self;
    timer = [NSTimer timerWithTimeInterval:0.02 target:self selector:@selector(<#selector#>) userInfo:nil repeats:YES];
   
}

//当界面出现后
- (void)viewDidAppear:(BOOL)animated
{
    //设置专辑封面圆角化
    self.albumCoverImage.layer.cornerRadius = self.albumCoverImage.bounds.size.width/2.0;

    self.albumCoverImage.layer.masksToBounds =YES;
    [super viewDidAppear:animated];
    [self initSongInfomation];//初始化歌曲信息
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    //结束remote控制
    [[UIApplication sharedApplication]endReceivingRemoteControlEvents];
    [self  resignFirstResponder];
    
}
- (void)updateProgress
{
    //歌曲播放的分钟 秒数
    int currentTimeMinutes = (unsigned)[PlayerController sharedInstance].currentPlaybackTime/60;
    int currenTimeSeconds = (unsigned)[PlayerController sharedInstance].currentPlaybackTime%60;
    //qq
    
    
}
@end
