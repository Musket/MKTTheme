//
//  MMThemeManager.h
//  ThemeManager
//
//  Created by Andrew Berry on 1/9/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMTheme.h"

@interface MMThemeManager : NSObject

@property (nonatomic, retain) id<MMTheme> theme;

+ (id)sharedManager;

@end
