//
//  MSRewardDemoViewController.m
//  MeteorShowSDK
//
//  Created by steve on 2020/4/26.
//  Copyright © 2020 upltv. All rights reserved.
//

#import "MSRewardDemoViewController.h"
#import "OpenUpLogListView.h"

#if __has_include(<MSSDK/MSSDK.h>)
    #import <MSSDK/MSSDK.h>
#else
    #import "MSSDK.h"
#endif

@interface MSRewardDemoViewController () <MSRewardedVideoDelegate>
{
    OpenUpLogListView *_logView;
}
@end

@implementation MSRewardDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    [backButton setTitle:@"close" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setLeftBarButtonItem:backItem];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.backgroundColor = [UIColor orangeColor];
    button1.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, 100, 250, 40);
    [button1 setTitle:@"isRewardReady" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(isRewardReadyClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.backgroundColor = [UIColor orangeColor];
    button2.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, 170, 250, 40);
    [button2 setTitle:@"showReward" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(showRewardClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    _logView = [[OpenUpLogListView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2)];
    _logView.layer.borderWidth = 1;
    _logView.layer.borderColor = [[UIColor whiteColor] CGColor];
    _logView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_logView];
}

- (void)close {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)isRewardReadyClick {
    
    [self logMessage:@"开始检查激励视频是否可以播放"];
    
    BOOL b = [MSSDK hasRewardAdAvailable];
    if (b) {
        [self logMessage:@"激励视频检查结果：可以播放"];
        NSLog(@"MSSDK Reward YES");
    }
    else {
        [self logMessage:@"激励视频检查结果：不可以播放"];
        NSLog(@"MSSDK Reward NO");
    }
}

- (void)showRewardClick {
    [self logMessage:@"激励视频 准备播放"];
    [MSSDK setRewardDelegate:self];
    [MSSDK presentRewardVideoAdForAdUnitID:@"xxx" fromViewController:self];
}

#pragma mark - MSRewardedVideoDelegate

- (void)MSRewardVideoAdDidOpen {
    [self logMessage:@"激励视频 打开"];
    NSLog(@"MSSDK MSRewardVideoAdDidOpen");
}

- (void)MSRewardVideoAdDidCilck {
    [self logMessage:@"激励视频 点击"];
    NSLog(@"MSSDK MSRewardVideoAdDidCilck");
}

- (void)MSRewardVideoAdDidRewardUserWithReward {
    [self logMessage:@"激励视频 发放奖励"];
    NSLog(@"MSSDK MSRewardVideoAdDidRewardUserWithReward");
}

- (void)MSRewardVideoAdDidClose {
    [self logMessage:@"激励视频 关闭"];
    NSLog(@"MSSDK MSRewardVideoAdDidClose");
}

#pragma mark - log

- (void)logMessage:(NSString *)message {
    [_logView addLogData:[OpenUpLogItemData LogData:message]];
}

- (void)logGreenMessage:(NSString *)message {
    OpenUpLogItemData *itemData = [OpenUpLogItemData LogData:message];
    itemData.level = OpenUpLogViewLOGLEVEL_i;
    [_logView addLogData:itemData];
}

- (void)logOrangeMessage:(NSString *)message {
    OpenUpLogItemData *itemData = [OpenUpLogItemData LogData:message];
    itemData.level = OpenUpLogViewLOGLEVEL_w;
    [_logView addLogData:itemData];
}

@end
