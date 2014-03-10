//
//  MKTThemeManager.h
//  ThemeManager
//
//  Created by Andrew Berry on 1/9/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKTTheme.h"

@interface MKTThemeManager : NSObject

@property (nonatomic, retain) id<MKTTheme> theme;

+ (id)sharedManager;

@end
