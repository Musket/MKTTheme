//
//  MMLightTheme.m
//  ThemeManager
//
//  Created by Andrew Berry on 1/9/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import "MMLightTheme.h"

@interface MMLightTheme()

@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *barTintColor;
@property (nonatomic, strong) UIColor *barTitleColor;
@property (nonatomic, strong) UIColor *viewColor;

@end

@implementation MMLightTheme

- (id)init {
    if (self = [super init]) {
        _tintColor = [UIColor colorWithHue:5.0f/360.0f saturation:1.0f brightness:1.0f alpha:1.0f];
        _barTintColor = [UIColor whiteColor];
        _barTitleColor = [UIColor blackColor];
        _viewColor = [UIColor whiteColor];
    }
    return self;
}

// Set the window tint color
- (void)themeWindowTintColor:(UIWindow *)window {
    [window setTintColor:_tintColor];
}

- (void)themeNavigationController:(UINavigationController *)navigationController {
    // Tints
    [navigationController.navigationBar setBarTintColor:_barTintColor];
    [navigationController.toolbar setBarTintColor:_barTintColor];
    // Text
    [navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: _barTitleColor}];
    // Bar style (fixes status bar)
    [navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    [navigationController.toolbar setBarStyle:UIBarStyleDefault];
}

- (void)themeTabBar:(UITabBar *)tabBar {
    // Tints
    [tabBar setBarTintColor:_barTintColor];
    [tabBar setBarStyle:UIBarStyleDefault];
}

- (void)themeViewController:(UIViewController *)viewController {
    [viewController.view setBackgroundColor:_viewColor];
}

- (void)themeTableViewController:(UITableViewController *)tableViewController {
    [tableViewController.tableView setBackgroundColor:_viewColor];
    [tableViewController.tableView setSeparatorColor:[UIColor lightGrayColor]];
    [self themeViewController:tableViewController];
}

- (void)themeTableViewCell:(UITableViewCell *)tableViewCell {
    // Background
    [tableViewCell setBackgroundColor:[UIColor whiteColor]];
    // Text
    [tableViewCell.textLabel setTextColor:[UIColor darkTextColor]];
    [tableViewCell.detailTextLabel setTextColor:[UIColor lightGrayColor]];
}

@end
