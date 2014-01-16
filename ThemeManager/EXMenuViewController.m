//
//  EXMenuViewController.m
//  ThemeManager
//
//  Created by Andrew Berry on 1/15/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import "EXMenuViewController.h"

#import "MMThemeManager.h"

@interface EXMenuViewController ()

@end

@implementation EXMenuViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Hide separators for empty cells
    [self.tableView setTableFooterView:[UIView new]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Apply theme
    [self applyActiveTheme];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Theme cell
    [[[MMThemeManager sharedManager] theme] themeTableViewCell:cell];
}

#pragma mark - Theme

- (void)applyActiveTheme {
    [[[MMThemeManager sharedManager] theme] themeTableViewController:self];
    // Fix visible cells
    [self.tableView reloadData];
}

@end