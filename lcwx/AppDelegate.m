//
//  AppDelegate.m
//  lcwx
//
//  Created by luck on 2018/1/7.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "BaseNavigationController.h"
#import "MSStoreService.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[MSStoreService sharedStoreService] setTimestamp:@"1515901776000"];
    [[MSStoreService sharedStoreService] setDevice_id:@"24621e7b2cc9462161000701790643b9"];
    [[MSStoreService sharedStoreService] setToken:@"dfaadb6f83d1ae990a3b2f0b0909f9c2,0,1515900706"];
    [[MSStoreService sharedStoreService] setSign:@"efbf35587e50f924835882035a7f19d4"];
    [[MSStoreService sharedStoreService] setUid:@"0"];

    self.window = [[UIWindow alloc]initWithFrame:ScreenBounds];
    self.window.rootViewController = [[BaseNavigationController alloc]initWithRootViewController:[[MainViewController alloc]init]];
    [self.window makeKeyAndVisible];
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
