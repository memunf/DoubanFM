//
//  SidebarController.m
//  DouBanMusic
//
//  Created by lkjy on 16/5/5.
//  Copyright © 2016年 lx. All rights reserved.
//

#import "SidebarController.h"
#import "PlayerViewController.h"
#import "ChannelsTableViewController.h"
#import <MJExtension.h>
@interface SidebarController (){
    //将他们作为sideBarController 成员变量
   // CDSideBarController* sideBar;
    //PlayerViewController* playerVC;
    ChannelsTableViewCell* channelsVC;
    UserInfoViewController *userInfoVC;
    AppDelegate* appDelegate;
}

@end

@implementation SidebarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    appDelegate = [[UIApplication sharedApplication]delegate];//设置应用程序的委托代理
    //将侧边栏上显示的图片存放在数组中
    NSArray *imageList = @[[UIImage imageNamed:@"menuPlayer"],
                           [UIImage imageNamed:@"menuChannel"],
                           [UIImage imageNamed:@"menuLogin"],
                           [UIImage imageNamed:@"menuClose.png"]];
    
//    sideBar = [CDSideBarController sharedInstanceWithImages:imageList];
//    sideBar.delegate =(id)self;
//    //拿到mainStoryboard
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    playerVC = [[PlayerViewController alloc]init];
//    
//    channelsVC = [[ChannelsTableViewController alloc]init];
//    channelsVC.delegate = (id)self;
//    userInfoVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"userInfoVC"];
//    self.viewControllers = @[playerVC, channelsVC, userInfoVC];//存放在数组中
    
}


//成为第一响应者
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBar.hidden =YES;//当界面将要出现时 tabbar隐藏
    for (UIView* child in self.tabBar.subviews)
    {
        if ([child isKindOfClass:[UIControl class]])
        {
            [child removeFromSuperview];//将child从父视图移除
        }
    }
    
}

@end
