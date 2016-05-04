//
//  UserInfoViewController.h
//  DouBanMusic
//
//  Created by lkjy on 16/5/4.
//  Copyright © 2016年 lx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *loginImage;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *playedLabel;
@property (strong, nonatomic) IBOutlet UILabel *likedLabel;
@property (strong, nonatomic) IBOutlet UILabel *bannedLabel;
- (IBAction)logoutButtonTapped:(UIButton *)sender;

@end
