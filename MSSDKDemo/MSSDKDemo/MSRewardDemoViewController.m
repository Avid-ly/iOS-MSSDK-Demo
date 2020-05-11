//
//  MSRewardDemoViewController.m
//  MeteorShowSDK
//
//  Created by steve on 2020/4/26.
//  Copyright © 2020 upltv. All rights reserved.
//

#import "MSRewardDemoViewController.h"

#if __has_include(<MSSDK/MSSDK.h>)
    #import <MSSDK/MSSDK.h>
#else
    #import "MSSDK.h"
#endif

@interface MSRewardDemoViewController () <MSRewardedVideoDelegate>

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
}

- (void)close {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)isRewardReadyClick {
    
    BOOL b = [MSSDK hasRewardAdAvailable];
    if (b) {
        NSLog(@"MSSDK Reward YES");
    }
    else {
        NSLog(@"MSSDK Reward NO");
    }
}

- (void)showRewardClick {
    [MSSDK setRewardDelegate:self];
    [MSSDK presentRewardVideoAdForAdUnitID:@"xxx" fromViewController:self];
}

#pragma mark - MSRewardedVideoDelegate

- (void)MSRewardVideoAdDidOpen {
    NSLog(@"MSSDK MSRewardVideoAdDidOpen");
}

- (void)MSRewardVideoAdDidCilck {
    NSLog(@"MSSDK MSRewardVideoAdDidCilck");
}

- (void)MSRewardVideoAdDidRewardUserWithReward {
    NSLog(@"MSSDK MSRewardVideoAdDidRewardUserWithReward");
}

- (void)MSRewardVideoAdDidClose {
    NSLog(@"MSSDK MSRewardVideoAdDidClose");
}

@end
