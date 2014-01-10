//
//  MMNavigationController.m
//  ThemeManager
//
//  Created by Andrew Berry on 1/9/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import "MMNavigationController.h"
#import "MMThemeManager.h"

@interface MMNavigationController ()

@end

@implementation MMNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // ...
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // TODO: would like it translucent, but not sure how to stop flash on initial load or when changing theme...
    [self.navigationBar setTranslucent:NO];
    [self.toolbar setTranslucent:NO];
    
    // Apply theme
    [self applyActiveTheme];
    // Observe theme change
    [[MMThemeManager sharedManager] addObserver:self forKeyPath:@"theme" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"theme"]) {
        // Apply active theme
        [self applyActiveTheme];

        // Prevent title transition 'bug' where those on the stack fade in with old text color
        for (UIViewController *vc in self.viewControllers) {
            
            if (vc.navigationItem.title) {
                NSString *tmp = vc.navigationItem.title;
                [vc.navigationItem setTitle:@""];
                [vc.navigationItem setTitle:tmp];
            }
            else if (vc.title) {
                NSString *tmp = vc.title;
                [vc setTitle:@""];
                [vc setTitle:tmp];
            }
        }
    }
}

#pragma mark - Theme

- (void)applyActiveTheme {
    [[[MMThemeManager sharedManager] theme] themeNavigationController:self];
}

@end
