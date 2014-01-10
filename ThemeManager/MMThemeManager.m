//
//  MMThemeManager.m
//  ThemeManager
//
//  Created by Andrew Berry on 1/9/14.
//  Copyright (c) 2014 Andrew Berry. All rights reserved.
//

#import "MMThemeManager.h"

@implementation MMThemeManager

#pragma mark - Singleton Methods

// http://www.galloway.me.uk/tutorials/singleton-classes/
+ (id)sharedManager {
    static MMThemeManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        // ...
    }
    return self;
}

@end