//
//  EXToggleViewController.h
//  ThemeManager
//
//  Created by Andrew Berry on 1/9/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EXToggleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *themeSwitch;

- (IBAction)didToggleThemeSwitch:(id)sender;

@end
