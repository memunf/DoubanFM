//
//  CDSideBarControllerDelegate.m
//  DouBanMusic
//
//  Created by lk on 16/5/7.
//  Copyright © 2016年 lx. All rights reserved.
//

#import "CDSideBarControllerDelegate.h"
static CDSideBarController* sharedInstance;
@implementation CDSideBarController
@synthesize menucolor = _menucolor;
@synthesize isOpen = _isOpen;
+(CDSideBarController*)shareInstanceWithImage:(NSArray*)image
{
    return sharedInstance;
}
+(CDSideBarController*)shareInstance
{
    return nil;
}
-(CDSideBarController*)initWithimage:(NSArray*)buttonList
{
    return nil;
}
-(void)inserMenuButtonOnView:(UIView*)view atPosition:(CGPoint)position
{

}
-(void)dismissMenu
{

}
@end
