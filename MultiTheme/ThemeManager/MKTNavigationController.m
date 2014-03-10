//
//  MKTNavigationController.m
//  ThemeManager
//
//  Created by Andrew Berry on 1/9/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import "MKTNavigationController.h"
#import "MKTThemeManager.h"

@interface MKTNavigationController ()

@end

@implementation MKTNavigationController

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
    // Apply theme
    [self style];
    // Observe theme change
    [[MKTThemeManager sharedManager] addObserver:self forKeyPath:@"theme" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[MKTThemeManager sharedManager] removeObserver:self forKeyPath:@"theme" context:NULL];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"theme"]) {
        // Apply active theme
        [self style];

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

- (void)style {
    [[[MKTThemeManager sharedManager] theme] themeNavigationController:self];
}

@end
