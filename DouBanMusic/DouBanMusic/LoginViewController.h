//
//  LoginViewController.h
//  DouBanMusic
//
//  Created by lkjy on 16/5/4.
//  Copyright © 2016年 lx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "NetworkManager.h"
#import "ProtocolClass.h"
@interface LoginViewController : UIViewController<DoubanDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *captchaImageview;/**<验证码*/
@property (strong, nonatomic) IBOutlet UITextField *username;/**<用户名*/
@property (strong, nonatomic) IBOutlet UITextField *password;/**<密码*/
@property (strong, nonatomic) IBOutlet UITextField *captcha;/**<验证码*/
- (IBAction)submitButtonTapped:(UIButton *)sender;/**<提交按钮*/
- (IBAction)cancelButtonTapped:(UIButton *)sender;/**<取消*/
- (IBAction)backgroundTap:(id)sender;/**<点击屏幕*/
@property(weak,nonatomic)id<DoubanDelegate>delegate;//将delegate作为它的属性

@end
