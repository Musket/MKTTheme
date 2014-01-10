//
//  EXToggleViewController.m
//  ThemeManager
//
//  Created by Andrew Berry on 1/9/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import "EXToggleViewController.h"
#import "MMThemeManager.h"
// Include themes for theme switcher
#import "MMDarkTheme.h"
#import "MMLightTheme.h"

@interface EXToggleViewController ()

@end

@implementation EXToggleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Turn switch on/off
    [_themeSwitch setOn:[[[MMThemeManager sharedManager] theme] isKindOfClass:[MMDarkTheme class]]];
    
    [self applyActiveTheme];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Theme

- (void)applyActiveTheme {
    // Update UI components
    [[[MMThemeManager sharedManager] theme] themeViewController:self];
}

#pragma mark - IBAction

- (IBAction)didToggleThemeSwitch:(id)sender {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if (((UISwitch *)sender).on) {
        [[MMThemeManager sharedManager] setTheme:[MMDarkTheme new]];
        [userDefaults setObject:@"dark" forKey:@"theme"];
    }
    else {
        [[MMThemeManager sharedManager] setTheme:[MMLightTheme new]];
        [userDefaults setObject:@"light" forKey:@"theme"];
    }
    
    [self applyActiveTheme];
    
    [userDefaults synchronize];
}

@end
