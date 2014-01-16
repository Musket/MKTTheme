//
//  MMTheme.h
//  ThemeManager
//
//  Created by Andrew Berry on 1/9/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MMTheme <NSObject>

- (void)themeWindowTintColor:(UIWindow *)window;

- (void)themeNavigationController:(UINavigationController *)navigationController;

- (void)themeTableViewController:(UITableViewController *)tableViewController;

- (void)themeViewController:(UIViewController *)viewController;

- (void)themeTabBar:(UITabBar *)tabBar;

- (void)themeTableViewCell:(UITableViewCell *)tableViewCell;

@end
