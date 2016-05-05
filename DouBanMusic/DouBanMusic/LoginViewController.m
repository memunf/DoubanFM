//
//  LoginViewController.m
//  DouBanMusic
//
//  Created by lkjy on 16/5/4.
//  Copyright © 2016年 lx. All rights reserved.
//

#import "LoginViewController.h"
#import "NetworkManager.h"
#import "UIImageView+AFNetworking.h"
@interface LoginViewController ()
{
    NSMutableString* captchaID;/**<验证码ID*/
    NetworkManager* networkManager;
    AppDelegate* appDelegate;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //从应用程序的单例类对象中得到应用程序委托的对象
    appDelegate = [[UIApplication sharedApplication]delegate];
    networkManager = [[NetworkManager alloc]init];
    networkManager.delegate =(id)self;//设置networkManager的代理
    //初始化点击图片事件
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(loadCaptchaImage)];
    [singleTap setNumberOfTouchesRequired:1];//设置单击点击请求
    self.captchaImageview.userInteractionEnabled =YES;//设置交互允许
    [self.captchaImageview addGestureRecognizer:singleTap];//添加单击手势到验证码图片上
    
    
}
//当试界面将要出现时要做的事
- (void)viewWillAppear:(BOOL)animated
{
    [self loadCaptchaImage];
    [super viewWillAppear:animated];
}
//加载验证码图片
- (void)loadCaptchaImage
{
    [networkManager loadCaptchaImage];//通过networkmanager 调用加载验证码
    
}
//通过URL拿到网上资源
- (void)setCaptchaImageWithURLString:(NSString*)url
{
    [self.captchaImageview setImageWithURL:[NSURL URLWithString:url]];
}
//提交用户登录的信息
- (IBAction)submitButtonTapped:(UIButton *)sender {
    NSString* username = _username.text;//拿到输入的内容
    NSString* password = _password.text;
    NSString* captcha = _captcha.text;
    [networkManager LoginwithUsername:username Password:password Captcha:captcha RememberOnorOff:@"off"];
}

//取消登录
- (IBAction)cancelButtonTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loadSuccess
{
    [_delegate setUserInfo];//初始化用户信息delegate
}
- (IBAction)backgroundTap:(id)sender {
//    点击屏幕后挂起
    [_username resignFirstResponder];
    [_password resignFirstResponder];
    [_captcha resignFirstResponder];
}

@end
