//
//  MMDarkTheme.m
//  ThemeManager
//
//  Created by Andrew Berry on 1/10/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import "MMDarkTheme.h"

@interface MMDarkTheme()

@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *barTintColor;
@property (nonatomic, strong) UIColor *barTitleColor;
@property (nonatomic, strong) UIColor *viewColor;

@end

@implementation MMDarkTheme

- (id)init {
    if (self = [super init]) {
        _tintColor = [UIColor colorWithHue:210.0f/360.0f saturation:1.0f brightness:1.0f alpha:1.0f];
        _barTintColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
        _barTitleColor = [UIColor whiteColor];
        _viewColor = [UIColor colorWithWhite:0.3f alpha:1.0f];
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
    [navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [navigationController.toolbar setBarStyle:UIBarStyleBlack];
}

- (void)themeViewController:(UIViewController *)viewController {
    [viewController.view setBackgroundColor:_viewColor];
}

- (void)themeTableView:(UITableView *)tableView {
    [tableView setBackgroundColor:_viewColor];
    [tableView setSeparatorColor:[UIColor colorWithWhite:0.3f alpha:1.0f]];
}

- (void)themeTableViewCell:(UITableViewCell *)tableViewCell {
    // Background
    [tableViewCell setBackgroundColor:[UIColor colorWithWhite:0.2f alpha:1.0f]];
    // Text
    [tableViewCell.textLabel setTextColor:[UIColor whiteColor]];
    [tableViewCell.detailTextLabel setTextColor:[UIColor colorWithWhite:0.4f alpha:1.0f]];
}

@end
