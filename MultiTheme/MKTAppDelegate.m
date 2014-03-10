//
//  MKTAppDelegate.m
//  MultiTheme
//
//  Created by Andrew Berry on 3/10/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import "MKTAppDelegate.h"
#import "MKTThemeManager.h"
#import "TMPDarkTheme.h"
#import "TMPLightTheme.h"
#import "TMPTableViewController.h"

@implementation MKTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    TMPTableViewController *root = [[TMPTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [root setTitle:@"MultiTheme"];
    
    [self setNavigationController:[[MKTNavigationController alloc] initWithRootViewController:root]];
    [self.window setRootViewController:_navigationController];
    
    // Init theme manager
    [MKTThemeManager sharedManager];
    [self setActiveTheme];
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Theme

- (void)setActiveTheme {
    [[MKTThemeManager sharedManager] setTheme:[TMPDarkTheme new]];
    [[[MKTThemeManager sharedManager] theme] themeWindow:self.window];
}

@end
