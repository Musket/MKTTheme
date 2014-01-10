//
//  EXDemoViewController.m
//  ThemeManager
//
//  Created by Andrew Berry on 1/10/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import "EXDemoViewController.h"
#import "MMThemeManager.h"

@interface EXDemoViewController ()

@end

@implementation EXDemoViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Hide separators for empty cells
    [self.tableView setTableFooterView:[UIView new]];
    
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

#pragma mark - UITableView

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [[[MMThemeManager sharedManager] theme] themeTableViewCell:cell];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"theme"]) {
        // Reload table view to re-theme cells
        [self.tableView reloadData];
        // Apply active theme
        [self applyActiveTheme];
    }
}

#pragma mark - Theme

- (void)applyActiveTheme {
    [[[MMThemeManager sharedManager] theme] themeTableView:self.tableView];
    [[[MMThemeManager sharedManager] theme] themeViewController:self];
}

@end
