//
//  CDSideBarControllerDelegate.h
//  DouBanMusic
//
//  Created by lk on 16/5/7.
//  Copyright © 2016年 lx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol CDSideBarControllerDelegate<NSObject>
-(void)menuButtonClicked:(int)index;
@end
@interface CDSideBarController : NSObject
{
    UIView              *_backgroundMenuView;
    UIButton            *_menuButton;
    NSMutableArray      *_buttonList;
    
}
@property(nonatomic,retain) UIColor* menucolor;
@property(nonatomic)BOOL isOpen;
@property(weak,nonatomic) id<CDSideBarControllerDelegate>delegate;
+(CDSideBarController*)shareInstanceWithImage:(NSArray*)image;
+(CDSideBarController*)shareInstance;
-(CDSideBarController*)initWithimage:(NSArray*)buttonList;
-(void)inserMenuButtonOnView:(UIView*)view atPosition:(CGPoint)position;
-(void)dismissMenu;
@end
