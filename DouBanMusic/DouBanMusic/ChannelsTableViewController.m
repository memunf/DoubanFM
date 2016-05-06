//
//  ChannelsTableViewController.m
//  DouBanMusic
//
//  Created by lkjy on 16/5/4.
//  Copyright © 2016年 lx. All rights reserved.
//

#import "ChannelsTableViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface ChannelsTableViewController (){
    AFHTTPRequestOperationManager *manager;
    AppDelegate* appDelegate;
    NetworkManager* networkManager;
    PlayerController* playerController;
}

@end

@implementation ChannelsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight= 80;//设置分组的header高度

    self.tableView.rowHeight = 60;//设置每一行的高度
    //出事工具类
    appDelegate = [[UIApplication sharedApplication]delegate];
    networkManager = [NetworkManager new];
    networkManager.delegate = self;//设置networkmanager的代理
    playerController = [PlayerController new];
    //初始化tableViewCell
    //加载nib文件
    UINib *cell = [UINib nibWithNibName:@"ChannelsViewController" bundle:nil];
    //通过nib文件创建重用的cell
    [self.tableView registerNib:cell forCellReuseIdentifier:@"identifier"];
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    //mjrefresh做下拉刷新
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(initChannelInfo)];

    //设置文字
    [self.tableView.header setTitle:@"下拉刷新更多" forState:MJRefreshHeaderStateIdle];
    [self.tableView.header setTitle:@"松开即可刷新" forState:MJRefreshHeaderStatePulling];
//    MJRefreshHeaderStateRefreshing,
//    /** 即将刷新的状态 */
//    MJRefreshHeaderStateWillRefresh
    [self.tableView.header setTitle:@"即将刷新的状态" forState:MJRefreshHeaderStateWillRefresh];
    [self.tableView.header setTitle:@"正在刷新" forState: MJRefreshHeaderStateRefreshing];
    // 设置字体
    self.tableView.header.font = [UIFont systemFontOfSize:15];
    
    // 设置颜色
    self.tableView.header.textColor = [UIColor grayColor];
    [self.tableView.header beginRefreshing];//进入刷新状态
    [super viewWillAppear:animated];



}

//初始化频道信息
- (void)initChannelInfo{

    
    //判断用户信息是否为空
//    if (appDelegate.userInfo.cookies == nil) {
//        [networkManager setChannel:1 withURLWithString:@"http://douban.fm/j/explore/get_recommend_chl"];
//    }
//    else{
//        [networkManager setChannel:1 withURLWithString:[NSString stringWithFormat:@"http://douban.fm/j/explore/get_login_chls?uk=%@",appDelegate.userInfo.userID]];
//    }
    [networkManager setChannel:2 withURLWithString:@"http://douban.fm/j/explore/up_trending_channels"];
    [networkManager setChannel:3 withURLWithString:@"http://douban.fm/j/explore/hot_channels"];

    [self.tableView.header endRefreshing];
    
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return [[ChannelInfo channelsTitleArray]count];//所有的频道个数
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [[[ChannelInfo channels]objectAtIndex:section]count];//返回每个频道内容的个数
}
//每一分区的标题
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[ChannelInfo channelsTitleArray]objectAtIndex:section];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier = @"identifier";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    //自定义的tableviewcell重用
    ChannelsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    //每一行显示的内容
    cell.textLabel.text = [[[[ChannelInfo channels]objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]valueForKey:@"name"];
    
    return cell;
}

#pragma mark -------<UITableviewdelegate>
//选中每一行进行操作
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
    [ChannelInfo updateCurrentCannel:[[[ChannelInfo channels]objectAtIndex:indexPath.section]objectAtIndex:indexPath.row ]];
    [networkManager loadPlaylistwithType:@"n"];
    [self.delegate menuButtonClicked:0];
}

//tableview重新加载数据 使用播放列表delegate
- (void)reloadTableviewData
{
    [self.tableView reloadData];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
