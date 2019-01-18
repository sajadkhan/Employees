//
//  Employee.m
//  Employees
//
//  Created by Muhammad Sajad on 17/01/2019.
//  Copyright © 2019 Muhammad Sajad. All rights reserved.
//

#import "Employee.h"

static NSUInteger const kStartingSalary = 10000;
NSString* const kSalaryCurrency = @"EUR";

@implementation Employee

- (instancetype)initWithName:(NSString*)name birthYear:(NSUInteger)birthYear
{
    self = [super init];
    if(self)
    {
        _name = name;
        _birthYear = birthYear;
        _salary = [[NSDecimalNumber alloc] initWithUnsignedInteger:kStartingSalary];
    }
    return self;
}


#pragma mark Salary Formatters

- (NSString *)formattedSalary {
    return [self formattedSalaryWithCode:kSalaryCurrency value:[NSNumber numberWithUnsignedInteger:kStartingSalary]];
}

- (NSString *)formattedSalaryWithCode:(NSString *)currencyCode value:(NSNumber *)value {
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    currencyFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    currencyFormatter.currencyCode = currencyCode;
    return [currencyFormatter stringFromNumber:value];
}

@end
