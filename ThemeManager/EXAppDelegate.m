//
//  EXAppDelegate.m
//  ThemeManager
//
//  Created by Andrew Berry on 1/9/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import "EXAppDelegate.h"
#import "MMThemeManager.h"
#import "MMLightTheme.h"
#import "MMDarkTheme.h"

@implementation EXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Init theme manager
    MMThemeManager *themeManager = [MMThemeManager sharedManager];

    // The active theme can be saved with user defaults (only applicable if the app has multiple themes)
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *theme = [userDefaults objectForKey:@"theme"];
    
    if (theme && [theme isEqualToString:@"dark"]) {
        // Set theme
        [themeManager setTheme:[MMDarkTheme new]];
    }
    else {
        [userDefaults setObject:@"light" forKey:@"theme"];
        [userDefaults synchronize];
        // Set theme
        [themeManager setTheme:[MMLightTheme new]];
    }
    
    // Apply theme
    [self applyActiveTheme];
    // Observe theme change
    [[MMThemeManager sharedManager] addObserver:self forKeyPath:@"theme" options:NSKeyValueObservingOptionNew context:NULL];
    
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

- (void)dealloc {
    // Remove KVO
    [[MMThemeManager sharedManager] removeObserver:self forKeyPath:@"theme" context:NULL];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"theme"]) {
        [self applyActiveTheme];
    }
}

#pragma mark - Theme

- (void)applyActiveTheme {
    [[[MMThemeManager sharedManager] theme] themeWindowTintColor:_window];
}

@end
