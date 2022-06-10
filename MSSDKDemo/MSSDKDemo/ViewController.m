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
#import "MSAdmobBannerDemoViewController.h"
//#import "MSMopubBannerDemoViewController.h"

#if __has_include(<MSSDK/MSSDK.h>)
    #import <MSSDK/MSSDK.h>
#else
    #import "MSSDK.h"
#endif

#import <GoogleMobileAds/GoogleMobileAds.h>
//#import <GoogleMobileAdsMediationTestSuite/GoogleMobileAdsMediationTestSuite.h>
#import <TraceAnalysisSDK/TraceAnalysis.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    float y = 50;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = [UIColor orangeColor];
    button.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, y, 250, 40);
    [button setTitle:@"initSDK" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(initSDK) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    y = button.frame.origin.y + button.frame.size.height + 30;
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.backgroundColor = [UIColor orangeColor];
    button1.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, y, 250, 40);
    [button1 setTitle:@"激励视频测试" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(rewardClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    y = button1.frame.origin.y + button1.frame.size.height + 30;
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.backgroundColor = [UIColor orangeColor];
    button3.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, y, 250, 40);
    [button3 setTitle:@"插屏广告测试" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(interstitialClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    y = button3.frame.origin.y + button3.frame.size.height + 30;
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.backgroundColor = [UIColor orangeColor];
    button4.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, y, 250, 40);
    [button4 setTitle:@"横幅广告测试" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(bannerClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    y = button4.frame.origin.y + button4.frame.size.height + 30;
    
//    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    button7.backgroundColor = [UIColor orangeColor];
//    button7.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, y, 250, 40);
//    [button7 setTitle:@"Admob中介测试" forState:UIControlStateNormal];
//    [button7 addTarget:self action:@selector(admobMediationTest) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button7];
//    y = button7.frame.origin.y + button7.frame.size.height;
    
    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button8.backgroundColor = [UIColor orangeColor];
    button8.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, y, 250, 40);
    [button8 setTitle:@"Admob中介测试" forState:UIControlStateNormal];
    [button8 addTarget:self action:@selector(admobAdInspectorTest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button8];
    y = button8.frame.origin.y + button8.frame.size.height;
}

- (void)initSDK {
    
    // 统计包初始化
    [TraceAnalysis initWithProductId:@"600001" ChannelId:@"32407" AppID:@"312312"];
    
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
//    MSMopubBannerDemoViewController *vc = [[MSMopubBannerDemoViewController alloc] init];
    MSAdmobBannerDemoViewController *vc = [[MSAdmobBannerDemoViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

- (void)admobMediationTest {
    
//    [GoogleMobileAdsMediationTestSuite presentOnViewController:self delegate:nil];
}

- (void)admobAdInspectorTest {
    
    GADMobileAds.sharedInstance.requestConfiguration.testDeviceIdentifiers = @[ @"c7bb11df8263fdd132d18ed5ab670f38" ];
    [GADMobileAds.sharedInstance presentAdInspectorFromViewController:self
      completionHandler:^(NSError *error) {
        NSLog(@"111111  %@",error);
    }];
}

@end
