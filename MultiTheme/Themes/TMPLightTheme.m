//
//  TMPLightTheme.m
//  MultiTheme
//
//  Created by Andrew Berry on 1/17/14.
//  Copyright (c) 2014 musketmade. All rights reserved.
//

#import "TMPLightTheme.h"
#import "UIColor+Chain.h"

@interface TMPLightTheme()

@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *lightGrayColor;
@property (nonatomic, strong) UIColor *midGrayColor;

@end

@implementation TMPLightTheme

- (id)init {
    if (self = [super init]) {
        _tintColor = [UIColor colorWithHue:350.0/360.0f saturation:0.85 brightness:1.0 alpha:1.0];
        _lightGrayColor = [UIColor colorWithHue:240.0/360.0 saturation:0.02 brightness:0.96 alpha:1.0];
        _midGrayColor = [UIColor colorWithHue:240.0/360.0 saturation:0.02 brightness:0.84 alpha:1.0];
    }
    return self;
}

- (void)themeWindow:(UIWindow *)window {
    [super themeWindow:window];
    [window setTintColor:_tintColor];
}

- (void)themeNavigationController:(UINavigationController *)navigationController {
    [super themeNavigationController:navigationController];
    // Tints
    [navigationController.navigationBar setBarTintColor:nil]; // Stop implicit animation...
    [navigationController.navigationBar setBarTintColor:_lightGrayColor];
    [navigationController.toolbar setBarTintColor:nil]; // Stop implicit animation...
    [navigationController.toolbar setBarTintColor:[UIColor whiteColor]];
    // Text
    [navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithWhite:0.1 alpha:1.0]}];
    // Fix status bar text color
    [navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    [navigationController.toolbar setBarStyle:UIBarStyleDefault];
}

- (void)themeViewController:(UIViewController *)viewController {
    [super themeViewController:viewController];
    [viewController.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)themeTableViewController:(UITableViewController *)tableViewController {
    [super themeTableViewController:tableViewController];
    [tableViewController.tableView setSeparatorColor:[UIColor lightGrayColor]];
    if (tableViewController.tableView.style == UITableViewStyleGrouped) {
        [tableViewController.view setBackgroundColor:_lightGrayColor];
    }
    else {
        [tableViewController.view setBackgroundColor:[UIColor whiteColor]];
    }
}

- (void)themeTableViewCell:(UITableViewCell *)tableViewCell {
    [super themeTableViewCell:tableViewCell];
    // Background
    [tableViewCell setBackgroundColor:[UIColor whiteColor]];
    // Text
    [tableViewCell.textLabel setTextColor:[UIColor darkTextColor]];
    [tableViewCell.detailTextLabel setTextColor:[UIColor lightGrayColor]];
    // Tint
    [tableViewCell setTintColor:_tintColor];
    
    if (tableViewCell.selectionStyle != UITableViewCellSelectionStyleNone) {
        UIView *selected = [UIView new];
        [selected setBackgroundColor:[UIColor colorWithHue:240.0/360.0 saturation:0.02 brightness:0.88 alpha:1.0]];
        [tableViewCell setSelectedBackgroundView:selected];
    }
}

- (void)themeSwitch:(UISwitch *)toggle {
    [super themeSwitch:toggle];
    [toggle setTintColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
    [toggle setOnTintColor:_tintColor];
}

@end
