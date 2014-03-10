//
//  TMPDarkTheme.m
//  MultiTheme
//
//  Created by Andrew Berry on 1/19/14.
//  Copyright (c) 2014 musketmade. All rights reserved.
//

#import "TMPDarkTheme.h"
#import "UIColor+Chain.h"

@interface TMPDarkTheme()

@property (nonatomic, strong) UIColor *tintColor;

@end

@implementation TMPDarkTheme

- (id)init {
    if (self = [super init]) {
        _tintColor = [UIColor colorWithHue:350.0/360.0f saturation:0.75 brightness:1.0 alpha:1.0];
    }
    return self;
}

- (void)themeWindow:(UIWindow *)window {
    [super themeWindow:window];
    [window setTintColor:_tintColor];
}

- (void)themeNavigationController:(UINavigationController *)navigationController {
    [super themeNavigationController:navigationController];
    [navigationController.navigationBar setBarTintColor:nil]; // Stop implicit animation...
    [navigationController.navigationBar setBarTintColor:[UIColor colorWithWhite:0.1 alpha:1.0]];
    [navigationController.toolbar setBarTintColor:nil]; // Stop implicit animation...
    [navigationController.toolbar setBarTintColor:[UIColor colorWithWhite:0.1 alpha:1.0]];
    // Text
    [navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    // Fix status bar text color
    [navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [navigationController.toolbar setBarStyle:UIBarStyleBlack];
}

- (void)themeViewController:(UIViewController *)viewController {
    [super themeViewController:viewController];
    [viewController.view setBackgroundColor:[UIColor colorWithWhite:0.2 alpha:1.0]];
}

- (void)themeTableViewController:(UITableViewController *)tableViewController {
    [super themeTableViewController:tableViewController];
    [tableViewController.tableView setSeparatorColor:[UIColor colorWithWhite:0.6 alpha:1.0]];
    if (tableViewController.tableView.style == UITableViewStyleGrouped) {
        [tableViewController.view setBackgroundColor:[UIColor colorWithWhite:0.15 alpha:1.0]];
    }
    else {
        [tableViewController.view setBackgroundColor:[UIColor colorWithWhite:0.2 alpha:1.0]];
    }
}

- (void)themeTableViewCell:(UITableViewCell *)tableViewCell {
    [super themeTableViewCell:tableViewCell];
    // Background
    [tableViewCell setBackgroundColor:[UIColor colorWithWhite:0.2 alpha:1.0]];
    // Text
    [tableViewCell.textLabel setTextColor:[UIColor whiteColor]];
    [tableViewCell.detailTextLabel setTextColor:[UIColor lightGrayColor]];
    [tableViewCell setTintColor:[UIColor whiteColor]];
    
    if (tableViewCell.selectionStyle != UITableViewCellSelectionStyleNone) {
        UIView *selected = [UIView new];
        [selected setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:1.0]];
        [tableViewCell setSelectedBackgroundView:selected];
    }
}

- (void)themeSwitch:(UISwitch *)toggle {
    [super themeSwitch:toggle];
    [toggle setTintColor:[UIColor colorWithWhite:0.4 alpha:1.0]];
    [toggle setOnTintColor:_tintColor];
}

@end
