//
//  EmployeeLoaderView.m
//  Employees
//
//  Created by Muhammad Sajad on 18/01/2019.
//  Copyright © 2019 Muhammad Sajad. All rights reserved.
//

#import "EmployeeLoaderView.h"
#import <EmployeesTheme.h>

static const CGFloat LoaderCornerRadius = 10.0;
static const CGFloat LoaderViewWidth = 100.0;
static const CGFloat LoaderViewHeight = 100.0;

@implementation EmployeeLoaderView

- (instancetype)init {
    self = [self initWithFrame:CGRectMake(0.0, 0.0, LoaderViewWidth, LoaderViewHeight)];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [[EmployeesTheme contentLoaderBGColor] colorWithAlphaComponent:LOADER_TRANSPERANCY];
    self.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    self.layer.cornerRadius = LoaderCornerRadius;
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    [spinner startAnimating];
    [self addSubview:spinner];
    self.hidden = true;
    return self;
}

@end
