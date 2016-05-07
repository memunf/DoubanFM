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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logoutButtonTapped:(UIButton *)sender {
}
@end
