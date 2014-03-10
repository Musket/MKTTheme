//
//  TMPTableViewController.m
//  MultiTheme
//
//  Created by Andrew Berry on 2/22/14.
//  Copyright (c) 2014 musketmade. All rights reserved.
//

#import "TMPTableViewController.h"
#import "MKTThemeManager.h"
#import "TMPDarkTheme.h"
#import "TMPLightTheme.h"

@interface TMPTableViewController()

@property (nonatomic, strong) NSString *theme;

@end

@implementation TMPTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Track the active theme
    // This is a quick example, you should use user defaults or something like that!
    _theme = @"dark";
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Toggle" style:UIBarButtonItemStyleBordered target:self action:@selector(didTapToggle:)]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Listen for type size changes
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredContentSizeChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
    // Theme
    [self applyThemeToVC];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)preferredContentSizeChanged:(NSNotification *)notification {
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell.textLabel setText:@"Foo Bar Baz"];

    // Theme
    [[[MKTThemeManager sharedManager] theme] themeTableViewCell:cell];
    return cell;
}

#pragma mark - Theme

- (void)applyThemeToVC {
    [[[MKTThemeManager sharedManager] theme] themeTableViewController:self];
}

#pragma mark - Action

- (void)didTapToggle:(id)sender {
    
    if ([_theme isEqualToString:@"dark"]) {
        _theme = @"light";
        // Change theme
        [[MKTThemeManager sharedManager] setTheme:[TMPLightTheme new]];
    }
    else {
        _theme = @"dark";
        // Change theme
        [[MKTThemeManager sharedManager] setTheme:[TMPDarkTheme new]];
    }

    // Theme visible cells
    [self.tableView reloadData];
    // Apply theme to VC
    [self applyThemeToVC];
}

@end
