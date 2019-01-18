//
//  Employee.h
//  Employees
//
//  Created by Muhammad Sajad on 17/01/2019.
//  Copyright © 2019 Muhammad Sajad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property (readonly, copy) NSString* name;
@property (readonly) NSUInteger birthYear;
@property (readonly, copy) NSDecimalNumber* salary;

- (instancetype)initWithName:(NSString*)name birthYear:(NSUInteger)birthYear;

- (NSString *)formattedSalary;
- (NSString *)formattedSalaryWithCode:(NSString*)currencyCode value:(NSNumber *)value;


@end
