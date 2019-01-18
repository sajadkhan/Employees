//
//  EmployeeTableViewCell.h
//  Employees
//
//  Created by Muhammad Sajad on 17/01/2019.
//  Copyright © 2019 Muhammad Sajad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"

NS_ASSUME_NONNULL_BEGIN

@interface EmployeeTableViewCell : UITableViewCell 
- (void)configureWithEmployee:(Employee*)employee;

@end

NS_ASSUME_NONNULL_END
