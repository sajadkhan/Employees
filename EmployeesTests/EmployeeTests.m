//
//  EmployeesTests.m
//  EmployeesTests
//
//  Created by Muhammad Sajad on 17/01/2019.
//  Copyright © 2019 Muhammad Sajad. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Employee.h"

@interface EmployeeTests : XCTestCase {
    Employee *employee;
}
@end

@implementation EmployeeTests


- (void)setUp {
    employee = [[Employee alloc] initWithName:@"Sajad" birthYear:1992];
    
}

- (void)tearDown {
    employee = nil;
}

- (void)testCurrencyFormattingWithDefaultValues {
    XCTAssertEqualObjects(employee.formattedSalary, @"€10,000.00", @"Currency Formatting is incorrect");
}

- (void)testCurrencyFormattingWithCustomValues {
    XCTAssertEqualObjects([employee formattedSalaryWithCode:@"USD" value:[NSNumber numberWithUnsignedInteger:98600]], @"$98,600.00", @"Currency Formatting is incorrect");
}

@end
