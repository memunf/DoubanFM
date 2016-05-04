//
//  LoginViewController.h
//  DouBanMusic
//
//  Created by lkjy on 16/5/4.
//  Copyright © 2016年 lx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *captchaImageview;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *captcha;
- (IBAction)submitButtonTapped:(UIButton *)sender;
- (IBAction)cancelButtonTapped:(UIButton *)sender;
- (IBAction)backgroundTap:(id)sender;

@end
