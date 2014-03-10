//
//  UIColor+Chain.m
//  Focus2
//
//  Created by Andrew Berry on 1/19/14.
//  Copyright (c) 2014 musketmade. All rights reserved.
//

#import "UIColor+Chain.h"

@implementation UIColor (Chain)

+ (UIColor*)defaultSystemTintColor
{
    static UIColor* systemTintColor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIView* view = [[UIView alloc] init];
        systemTintColor = view.tintColor;
    });
    return systemTintColor;
}

@end
