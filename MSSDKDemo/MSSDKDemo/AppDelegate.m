//
//  AppDelegate.m
//  MSSDKDemo
//
//  Created by steve on 2020/4/29.
//  Copyright © 2020 UPLTV Technology Co.,Ltd. All rights reserved.
//

#import "AppDelegate.h"

#if __has_include(<MSSDK/MSSDK.h>)
    #import <MSSDK/MSSDK.h>
#else
    #import "MSSDK.h"
#endif

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}


@end
