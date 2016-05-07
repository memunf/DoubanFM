//
//  UserInfoViewController.m
//  DouBanMusic
//
//  Created by lkjy on 16/5/4.
//  Copyright © 2016年 lx. All rights reserved.
//

#import "UserInfoViewController.h"
#import "CDSideBarController.h"
@interface UserInfoViewController ()
{
    NetworkManager* networkManger;
    UIStoryboard* mainStoryboard;
    AppDelegate* appDelegate;
}
@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载名为Main的storyboard
    mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    appDelegate = [[UIApplication sharedApplication] delegate];
    //给登陆图片添加手势
    UITapGestureRecognizer* singTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(loginImageTappde)];
    //设置有效点击次数
    [singTap setNumberOfTapsRequired:1];
    //允许用户交互
    self.loginImage.userInteractionEnabled = YES;
    //把手势添加到登陆图片上
    [self.loginImage addGestureRecognizer:singTap];
    networkManger = [[NetworkManager alloc]init];
    networkManger.delegate = (id)self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setUserinfo];
}
-(void)viewDidLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _loginImage.layer.cornerRadius = _loginImage.frame.size.width;
    if (!_loginImage.clipsToBounds)
    {
        _loginImage.clipsToBounds = YES;
    }

}
-(void)loginImageTappde
{
    LoginViewController* loginVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"loginVC"];
    loginVC.delegate = (id)self;
//    [CDSideBarController shareInstance]dismissMenu];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)logoutButtonTapped:(UIButton *)sender
{
    //添加提示弹出框
    UIAlertView* alertview =  [[UIAlertView alloc]initWithTitle:@"登出" message:@"您确定要登出吗" delegate:self cancelButtonTitle:@"" otherButtonTitles:@"确定", nil];
    [alertview show];    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
            break;
        case 1:
            [networkManger logout];
            break;
        default:
            break;
    }
}
-(void)setUserInfo
{
    if (appDelegate.userInfo.cookies)
    {
        [_loginImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img3.douban.com/icon/ul%@-1.jpg",appDelegate.userInfo.userID]]];
        _loginImage.userInteractionEnabled = NO;
        _usernameLabel.text = appDelegate.userInfo.name;
        _playedLabel.text = appDelegate.userInfo.played;
        _likedLabel.text = appDelegate.userInfo.liked;
        _bannedLabel.text = appDelegate.userInfo.banned;
        _logoutButton.hidden = NO;
    }else
    {
        [_loginImage setImage:[UIImage imageNamed:@"login"]];
        _loginImage.userInteractionEnabled = YES;
        _usernameLabel.text = @"";
        _playedLabel.text = @"0";
        _likedLabel.text = @"0";
        _bannedLabel.text = @"0";
        _logoutButton.hidden = YES;
    }
    
}
@end
