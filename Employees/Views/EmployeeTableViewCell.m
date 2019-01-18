//
//  EmployeeTableViewCell.m
//  Employees
//
//  Created by Muhammad Sajad on 17/01/2019.
//  Copyright © 2019 Muhammad Sajad. All rights reserved.
//

#import "EmployeeTableViewCell.h"
#import <EmployeesTheme.h>

@interface EmployeeTableViewCell() {
    UILabel *nameLabel;
    UILabel *birthYearLabel;
    UILabel *salaryLabel;
}

@end

@implementation EmployeeTableViewCell

- (void)configureWithEmployee:(Employee*)employee {
    nameLabel.text = employee.name;
    birthYearLabel.text = [NSString stringWithFormat:@"Born in %lu", (unsigned long)employee.birthYear];
    salaryLabel.text = [NSString stringWithFormat:@"Earns %@", employee.formattedSalary];
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.backgroundColor = [EmployeesTheme employeeCellBGColor];
    
    nameLabel = [[UILabel alloc] init];
    birthYearLabel = [[UILabel alloc] init];
    salaryLabel = [[UILabel alloc] init];
    
    nameLabel.font = [UIFont systemFontOfSize:19.0 weight:UIFontWeightMedium];
    nameLabel.textColor = [UIColor darkGrayColor];
    
    birthYearLabel.font = [UIFont systemFontOfSize:15.0];
    birthYearLabel.textColor = [UIColor lightGrayColor];
    
    salaryLabel.font = [UIFont systemFontOfSize:15.0];
    salaryLabel.textColor = [UIColor lightGrayColor];
    
    
    [self addSubview:nameLabel];
    [self addSubview:birthYearLabel];
    [self addSubview:salaryLabel];
    
    [self setupConstraints];
    
    return self;
}

- (void)setupConstraints {
    const CGFloat margin = 8.0;
    UILayoutGuide *guide = self.layoutMarginsGuide;
    
    //Name Label Constraints
    nameLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    [nameLabel.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor constant:margin].active = true;
    [nameLabel.topAnchor constraintEqualToAnchor:guide.topAnchor constant:margin].active = true;
    
    
    //Birth Year Label Constraints
    birthYearLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    [birthYearLabel.topAnchor constraintEqualToAnchor:nameLabel.bottomAnchor constant:margin].active = true;
    [birthYearLabel.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor constant:margin].active = true;
    [birthYearLabel.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor constant:-margin].active = true;
    
    
    //Salary Label Constraints
    salaryLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    [salaryLabel.centerYAnchor constraintEqualToAnchor:guide.centerYAnchor constant:margin].active = true;
    [salaryLabel.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor constant:margin].active = true;
    
}

@end
