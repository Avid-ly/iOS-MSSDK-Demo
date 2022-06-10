//
//  MSBannerDemoViewController.m
//  MeteorShowSDK
//
//  Created by steve on 2020/4/26.
//  Copyright © 2020 upltv. All rights reserved.
//

#import "MSMopubBannerDemoViewController.h"

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

@interface MSMopubBannerDemoViewController () <MPAdViewDelegate>
{
    MPAdView *_bannerView;
}
@end

@implementation MSMopubBannerDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollView.frame.size.height*2);
    [self.view addSubview:scrollView];
    
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
    [scrollView addSubview:button1];
}

- (void)close {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)bannerClick {
    
    NSString *mopubVersion = [[MoPub sharedInstance] version];
    NSLog(@"[Banner] mopub bersion : %@",mopubVersion);

    _bannerView = (MPAdView *)[MSSDK initBannerView];
    NSLog(@"%f  %f",kMPPresetMaxAdSizeMatchFrame.width,kMPPresetMaxAdSizeMatchFrame.height);
    _bannerView.delegate = self;
    _bannerView.frame = CGRectMake(0, 0, 320, 90);
    [self.view addSubview:_bannerView];
    [_bannerView loadAdWithMaxAdSize:kMPPresetMaxAdSizeMatchFrame];
    NSLog(@"[Banner] call loadAdWithMaxAdSize:");
}

#pragma mark - MPBannerDelegate

- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}

- (void)adViewDidLoadAd:(MPAdView *)view adSize:(CGSize)adSize {
    CGSize size = adSize;
    _bannerView.frame = CGRectMake(self.view.frame.size.width/2 - size.width/2, self.view.frame.size.height - size.height, size.width, size.height);
    NSLog(@"[Banner] call adViewDidLoadAd");
}

- (void)adView:(MPAdView *)view didFailToLoadAdWithError:(NSError *)error {
    NSLog(@"[Banner] call adView:didFailToLoadAdWithError and error: %@",error);
}

- (void)willPresentModalViewForAd:(MPAdView *)view {
    NSLog(@"[Banner] call willPresentModalViewForAd");
}

- (void)didDismissModalViewForAd:(MPAdView *)view {
    NSLog(@"[Banner] call didDismissModalViewForAd");
}

- (void)willLeaveApplicationFromAd:(MPAdView *)view {
    NSLog(@"[Banner] call willLeaveApplicationFromAd");
}

@end
