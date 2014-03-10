//
//  TMPBaseTheme.m
//  MultiTheme
//
//  Created by Andrew Berry on 2/11/14.
//  Copyright (c) 2014 musketmade. All rights reserved.
//

#import "TMPBaseTheme.h"

@implementation TMPBaseTheme

- (void)themeWindow:(UIWindow *)window {

}

- (void)themeNavigationController:(UINavigationController *)navigationController {
    
}

- (void)themeViewController:(UIViewController *)viewController {

}

- (void)themeTableViewController:(UITableViewController *)tableViewController {

}

- (void)themeTableViewCell:(UITableViewCell *)tableViewCell {
    [tableViewCell.textLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
    [tableViewCell.detailTextLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
}

- (void)themeSwitch:(UISwitch *)toggle {

}

@end
