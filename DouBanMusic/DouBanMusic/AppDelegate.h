//
//  AppDelegate.h
//  DouBanMusic
//
//  Created by lkjy on 16/4/29.
//  Copyright © 2016年 lx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<MediaPlayer/MediaPlayer.h>
#import "UserInfo.h"
#import "DFMPlaylist.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)UserInfo* userInfo;/**<用户信息>*/

@end

