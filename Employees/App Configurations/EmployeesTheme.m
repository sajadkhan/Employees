//
//  EmployeesTheme.m
//  Employees
//
//  Created by Muhammad Sajad on 18/01/2019.
//  Copyright © 2019 Muhammad Sajad. All rights reserved.
//

#import "EmployeesTheme.h"

@implementation EmployeesTheme
+ (UIColor *)contentLoaderBGColor {
    return [UIColor colorWithRed:LOADER_BG_COLOUR_R/255.0
                           green:LOADER_BG_COLOUR_G/255.0
                            blue:LOADER_BG_COLOUR_B/255.0
                           alpha:1.0];
}

+ (UIColor *)navigationBarTintColor {
    return [UIColor colorWithRed:NAVIGATION_BAR_TINT_COLOUR_R/255.0
                           green:NAVIGATION_BAR_TINT_COLOUR_G/255.0
                            blue:NAVIGATION_BAR_TINT_COLOUR_B/255.0
                           alpha:1.0];
}

+ (UIColor *)employeeCellBGColor {
    return [UIColor colorWithRed:EMPLOYEE_CELL_BG_COLOUR_R/255.0
                           green:EMPLOYEE_CELL_BG_COLOUR_G/255.0
                            blue:EMPLOYEE_CELL_BG_COLOUR_B/255.0
                           alpha:EMPLOYEE_CELL_BG_COLOUR_ALPHA];
}

@end
