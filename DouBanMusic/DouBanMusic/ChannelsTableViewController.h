//
//  ChannelsTableViewController.h
//  DouBanMusic
//
//  Created by lkjy on 16/5/4.
//  Copyright © 2016年 lx. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import <AFNetworking/AFNetworking.h>
//#import "ChannelsTableViewCell.h"
//#import "AppDelegate.h"
//#import "ChannelInfo.h"
//#import "NetworkManager.h"
//#import "ProtocolClass.h"
//#import "PlayerController.h"
#import "AFNetworking/AFNetworking.h"
#import "ChannelsTableViewCell.h"
#import "ChannelInfo.h"
#import "AppDelegate.h"
#import "NetworkManager.h"
#import "PlayerController.h"
#import "ProtocolClass.h"

@interface ChannelsTableViewController : UITableViewController<DoubanDelegate>//拿到代理

@property(nonatomic,weak)id<DoubanDelegate>delegate;
@property(nonatomic,strong)NSMutableArray* channels;/**<频道数组*/
@property(nonatomic,strong)NSArray* channelsTitle;/**<频道标题数组*/
@property(nonatomic,strong)NSArray* myChannels;/**<我的兆赫数组*/
@property(nonatomic,strong)NSMutableArray* reconmmendChannels;/**<推荐频道数组*/
@property(nonatomic,strong)NSMutableArray* upTrendingChannels;/**<上升最快频道数组*/
@property(nonatomic,strong)NSMutableArray* hotChannels;/**<热门频道数组*/
@end
