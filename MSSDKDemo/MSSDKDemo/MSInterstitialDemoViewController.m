//
//  MSInterstitialDemoViewController.m
//  MeteorShowSDK
//
//  Created by steve on 2020/4/26.
//  Copyright © 2020 upltv. All rights reserved.
//

#import "MSInterstitialDemoViewController.h"
#import "OpenUpLogListView.h"

#if __has_include(<MSSDK/MSSDK.h>)
    #import <MSSDK/MSSDK.h>
#else
    #import "MSSDK.h"
#endif

@interface MSInterstitialDemoViewController () <MSInterstitialDelegate>
{
    OpenUpLogListView *_logView;
}
@end

@implementation MSInterstitialDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    [backButton setTitle:@"close" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setLeftBarButtonItem:backItem];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.backgroundColor = [UIColor orangeColor];
    button3.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, 100, 250, 40);
    [button3 setTitle:@"isInterstitialReady" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(isInterstitialReadyClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.backgroundColor = [UIColor orangeColor];
    button4.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, 170, 250, 40);
    [button4 setTitle:@"showInterstitial" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(showInterstitialClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
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

- (void)isInterstitialReadyClick {
    
    [self logMessage:@"开始检查插屏广告是否可以播放"];
    
    BOOL b = [MSSDK hasInterstitialAdAvailable];
    if (b) {
        [self logMessage:@"插屏广告检查结果：可以播放"];
        NSLog(@"MSSDK Interstitial YES");
    }
    else {
        [self logMessage:@"插屏广告检查结果：不可以播放"];
        NSLog(@"MSSDK Interstitial NO");
    }
}

- (void)showInterstitialClick {
    
    [self logMessage:@"插屏广告 准备播放"];
    
    [MSSDK setInterstitialDelegate:self];
    [MSSDK presentInterstitialForAdUnitID:@"xxx1" fromViewController:self];
}

#pragma mark - MSInterstitialDelegate

- (void)MSInterstitialAdDidOpen {
    [self logMessage:@"插屏广告 打开"];
    NSLog(@"MSSDK MSInterstitialAdDidOpen");
}

- (void)MSInterstitialAdDidCilck {
    [self logMessage:@"插屏广告 点击"];
    NSLog(@"MSSDK MSInterstitialAdDidCilck");
}

- (void)MSInterstitialAdDidClose {
    [self logMessage:@"插屏广告 关闭"];
    NSLog(@"MSSDK MSInterstitialAdDidClose");
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
