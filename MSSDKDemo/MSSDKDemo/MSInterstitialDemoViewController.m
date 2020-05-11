//
//  MSInterstitialDemoViewController.m
//  MeteorShowSDK
//
//  Created by steve on 2020/4/26.
//  Copyright © 2020 upltv. All rights reserved.
//

#import "MSInterstitialDemoViewController.h"

#if __has_include(<MSSDK/MSSDK.h>)
    #import <MSSDK/MSSDK.h>
#else
    #import "MSSDK.h"
#endif

@interface MSInterstitialDemoViewController () <MSInterstitialDelegate>

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
}

- (void)close {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)isInterstitialReadyClick {
    
    BOOL b = [MSSDK hasInterstitialAdAvailable];
    if (b) {
        NSLog(@"MSSDK Interstitial YES");
    }
    else {
        NSLog(@"MSSDK Interstitial NO");
    }
}

- (void)showInterstitialClick {
    [MSSDK setInterstitialDelegate:self];
    [MSSDK presentInterstitialForAdUnitID:@"xxx1" fromViewController:self];
}

#pragma mark - MSInterstitialDelegate

- (void)MSInterstitialAdDidOpen {
    NSLog(@"MSSDK MSInterstitialAdDidOpen");
}

- (void)MSInterstitialAdDidCilck {
    NSLog(@"MSSDK MSInterstitialAdDidCilck");
}

- (void)MSInterstitialAdDidClose {
    NSLog(@"MSSDK MSInterstitialAdDidClose");
}

@end
