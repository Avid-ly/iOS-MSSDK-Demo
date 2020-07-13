//
//  ViewController.m
//  MSSDKDemo
//
//  Created by steve on 2020/4/29.
//  Copyright © 2020 UPLTV Technology Co.,Ltd. All rights reserved.
//

#import "ViewController.h"

#import "MSRewardDemoViewController.h"
#import "MSInterstitialDemoViewController.h"
#import "MSBannerDemoViewController.h"

#if __has_include(<MSSDK/MSSDK.h>)
    #import <MSSDK/MSSDK.h>
#else
    #import "MSSDK.h"
#endif

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = [UIColor orangeColor];
    button.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, 50, 250, 40);
    [button setTitle:@"initSDK" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(initSDK) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.backgroundColor = [UIColor orangeColor];
    button1.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, 120, 250, 40);
    [button1 setTitle:@"激励视频测试" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(rewardClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.backgroundColor = [UIColor orangeColor];
    button3.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, 190, 250, 40);
    [button3 setTitle:@"插屏广告测试" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(interstitialClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.backgroundColor = [UIColor orangeColor];
    button4.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, 260, 250, 40);
    [button4 setTitle:@"横幅广告测试" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(bannerClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
}

- (void)initSDK {
    
//    // 无回调的初始化方法
//    [MSSDK initSDK];
    
    // 有回调的初始化方法
    [MSSDK initSDKCompletion:^{
        NSLog(@"InitSDK Completion");
    }];
}

- (void)rewardClick {
    MSRewardDemoViewController *vc = [[MSRewardDemoViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

- (void)interstitialClick {
    MSInterstitialDemoViewController *vc = [[MSInterstitialDemoViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

- (void)bannerClick {
    MSBannerDemoViewController *vc = [[MSBannerDemoViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

@end
