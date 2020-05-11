//
//  MSBannerDemoViewController.m
//  MeteorShowSDK
//
//  Created by steve on 2020/4/26.
//  Copyright © 2020 upltv. All rights reserved.
//

#import "MSBannerDemoViewController.h"

#if __has_include(<MSSDK/MSSDK.h>)
    #import <MSSDK/MSSDK.h>
#else
    #import "MSSDK.h"
#endif

#if __has_include(<MoPub/MoPub.h>)
    #import <MoPub/MoPub.h>
#elif __has_include(<MoPubSDKFramework/MoPub.h>)
    #import <MoPubSDKFramework/MoPub.h>
#else
    #import "MoPub.h"
#endif

@interface MSBannerDemoViewController () <MPAdViewDelegate>
{
    MPAdView *_bannerView;
}
@end

@implementation MSBannerDemoViewController

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
    [button1 setTitle:@"加载横幅广告" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(bannerClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

- (void)close {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)bannerClick {
    
    _bannerView = [MSSDK initBannerView];
    _bannerView.frame = CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50);
    NSLog(@"%f  %f",kMPPresetMaxAdSizeMatchFrame.width,kMPPresetMaxAdSizeMatchFrame.height);
    _bannerView.delegate = self;
//    _bannerView.backgroundColor = [UIColor orangeColor];
    [_bannerView loadAdWithMaxAdSize:kMPPresetMaxAdSizeMatchFrame];
    [self.view addSubview:_bannerView];
}

#pragma mark - MPBannerDelegate

- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}

- (void)adViewDidLoadAd:(MPAdView *)view adSize:(CGSize)adSize {
    NSLog(@"Banner adViewDidLoadAd");
}

- (void)adView:(MPAdView *)view didFailToLoadAdWithError:(NSError *)error {
    NSLog(@"Banner adView:didFailToLoadAdWithError");
}

- (void)willPresentModalViewForAd:(MPAdView *)view {
    NSLog(@"Banner willPresentModalViewForAd");
}

- (void)didDismissModalViewForAd:(MPAdView *)view {
    NSLog(@"Banner didDismissModalViewForAd");
}

- (void)willLeaveApplicationFromAd:(MPAdView *)view {
    NSLog(@"Banner willLeaveApplicationFromAd");
}

@end
