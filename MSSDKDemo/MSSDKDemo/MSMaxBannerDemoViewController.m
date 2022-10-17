//
//  MSMaxBannerDemoViewController.m
//  MeteorShowSDK
//
//  Created by steve on 2022/6/7.
//  Copyright © 2022 upltv. All rights reserved.
//

#import "MSMaxBannerDemoViewController.h"

#if __has_include(<MSSDK/MSSDK.h>)
    #import <MSSDK/MSSDK.h>
#else
    #import "MSSDK.h"
#endif

#import <AppLovinSDK/AppLovinSDK.h>

@interface MSMaxBannerDemoViewController () <MAAdViewAdDelegate, MAAdRevenueDelegate>
@property (nonatomic, strong) MAAdView *adView;
@end

@implementation MSMaxBannerDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"MAX Banner Test";
    
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
    self.adView = (MAAdView *)[MSSDK initBannerView];
    
    self.adView.delegate = self;
    self.adView.revenueDelegate = self;
    
    // Calculate dimensions
    CGFloat width = CGRectGetWidth(self.view.bounds); // Stretch to the width of the screen for banners to be fully functional
    CGFloat height = (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) ? 90 : 50; // Banner height on iPhone and iPad is 50 and 90, respectively
    CGFloat x = 0;
    CGFloat y = self.view.frame.size.height - height;
    
    self.adView.frame = CGRectMake(x, y, width, height);
    
    // Set background or background color for banners to be fully functional
    self.adView.backgroundColor = UIColor.blackColor;
    
    [self.view addSubview: self.adView];
    
    // Load the first ad
    [self.adView loadAd];
}

#pragma mark - MAAdDelegate Protocol

- (void)didLoadAd:(MAAd *)ad
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)didFailToLoadAdForAdUnitIdentifier:(NSString *)adUnitIdentifier withError:(MAError *)error
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)didDisplayAd:(MAAd *)ad
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)didHideAd:(MAAd *)ad
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)didClickAd:(MAAd *)ad
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)didFailToDisplayAd:(MAAd *)ad withError:(MAError *)error
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

#pragma mark - MAAdViewAdDelegate Protocol

- (void)didExpandAd:(MAAd *)ad
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)didCollapseAd:(MAAd *)ad
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

#pragma mark - MAAdRevenueDelegate Protocol

- (void)didPayRevenueForAd:(MAAd *)ad
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

@end
