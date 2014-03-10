//
//  MKTTheme.h
//  MultiTheme
//
//  Created by Andrew Berry on 1/9/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MKTTheme <NSObject>

- (void)themeWindow:(UIWindow *)window;

- (void)themeNavigationController:(UINavigationController *)navigationController;

- (void)themeTableViewController:(UITableViewController *)tableViewController;

- (void)themeViewController:(UIViewController *)viewController;

- (void)themeTableViewCell:(UITableViewCell *)tableViewCell;

- (void)themeSwitch:(UISwitch *)toggle;

@end
