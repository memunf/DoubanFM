//
//  AppDelegate.m
//  DouBanMusic
//
//  Created by lkjy on 16/4/29.
//  Copyright © 2016年 lx. All rights reserved.
//

#import "AppDelegate.h"
//#import "SongInfo.h"
//#import "ChannelInfo.h"
#import <AVFoundation/AVFoundation.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self loadArchiver];//加载数据
        [self initChannelsDate];
        AVAudioSession * session=[AVAudioSession sharedInstance];//拿到音频播放的单利
        [session setCategory:AVAudioSessionCategoryPlayback error:nil];//设置音频会话类别：独占音乐播放，后台播放
        [session setActive:YES error:nil];//启动
    });*/
        // Override point for customization after application launch.
    return YES;
}
/*-(void)loadArchiver
{
    NSString* homePath=[NSHomeDirectory() stringByAppendingString:@"documents"];//沙盒路径
    NSString * appdelegatePath=[homePath stringByAppendingString:@"appdelegate.archiver"];//归档的数据
    NSData* data=[[NSData alloc]initWithContentsOfFile:appdelegatePath];//拿出在UserInfo中归档的数据
    NSKeyedUnarchiver * unarchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];//反序列化数据
    _userInfo=[unarchiver decodeObjectForKey:@"userInfo"];
    [unarchiver finishDecoding];
    if ([ChannelInfo currentChannel]==nil) {//初始化Channnel
        ChannelInfo * currentChannel=[ChannelInfo new];
        currentChannel.name=@"我的私人";
        currentChannel.ID=@"0";
        [ChannelInfo updateCurrentCannel:currentChannel];
    }
    if (_userInfo==nil) {//如果个人信息为nil，初始化
        _userInfo=[UserInfo new];
    }
}
-(void)initChannelsDate//初始化数据源Array
{
    [ChannelInfo updateChannelsTitleArray:@[@"我的兆赫",@"推荐频道",@"上升最快兆赫",@"热门兆赫"]];
    NSMutableArray* channels=[ChannelInfo  channels];//所有频道数组
    ChannelInfo* myPrivateChannel=[ChannelInfo new];
    myPrivateChannel.name=@"我的私人";
    myPrivateChannel.ID=@"0";
    ChannelInfo *myRedheartChannel = [ChannelInfo new];//我的红心频道
    myRedheartChannel.name = @"我的红心";
    myRedheartChannel.ID = @"-3";
    NSArray *myChannels = @[myPrivateChannel, myRedheartChannel];
    [channels addObject:myChannels];
    NSArray *recommendChannels = [NSMutableArray array];//推荐兆赫
    [channels addObject:recommendChannels];
    NSMutableArray *upTrendingChannels = [NSMutableArray array];//上升最快兆赫
    [channels addObject:upTrendingChannels];
    NSMutableArray *hotChannels = [NSMutableArray array]; //热门兆赫
    [channels addObject:hotChannels];
}*/
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    //[self.userInfo archiverUserInfo];//对userinfo进行归档
}

@end
