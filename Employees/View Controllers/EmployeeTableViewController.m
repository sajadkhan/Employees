//
//  EmployeeTableViewController.m
//  Employees
//
//  Created by Muhammad Sajad on 17/01/2019.
//  Copyright © 2019 Muhammad Sajad. All rights reserved.
//

#import "EmployeeTableViewController.h"
#import "EmployeeTableViewCell.h"
#import "EmployeeLoaderView.h"
#import "Employee.h"
#import "EmployeeDirectory.h"
#import <EmployeesTheme.h>

NSString *employeeCellIdentifier = @"employeeCell";

@interface EmployeeTableViewController () {
    EmployeeLoaderView *loaderView;
}
//Model
@property (nonatomic, strong) NSArray* employees;
@end

@implementation EmployeeTableViewController

#pragma mark - Setter/Getters
- (void)setEmployees:(NSArray *)employees {
    _employees = employees;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}


#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(handleDataUpdateWith:) name:kEmployeeDirectoryDidUpdateNotification object:nil];
    
    if (!self.employees) {
        [self fetchEmployees];
    }
}

- (void)setup {
    [self.tableView registerClass:EmployeeTableViewCell.class forCellReuseIdentifier:employeeCellIdentifier];
    
    self.title = @"Employee";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(arrangeButtonTap:)];
    self.navigationController.navigationBar.tintColor = [EmployeesTheme navigationBarTintColor];
    self.navigationController.navigationBar.titleTextAttributes = [[NSDictionary alloc] initWithObjectsAndKeys:[EmployeesTheme navigationBarTintColor], NSForegroundColorAttributeName, nil];
    
    
    loaderView = [[EmployeeLoaderView alloc] init];
    loaderView.center = CGPointMake(self.navigationController.view.bounds.size.width/2, self.navigationController.view.bounds.size.height/2);
    if (self.navigationController)
        [self.navigationController.view addSubview:loaderView];
    else
        [self.view addSubview:loaderView];
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 80.0;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

#pragma mark - Data Manipulator

- (void)fetchEmployees {
    loaderView.hidden = false;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        EmployeeDirectory *directory = [[EmployeeDirectory alloc] init];
        [directory update];
    });
}

- (void)handleDataUpdateWith:(NSNotification *)notification {
    if (!loaderView.hidden)
        loaderView.hidden = true;
    if ([notification.object isKindOfClass:[EmployeeDirectory class]]) {
        EmployeeDirectory *directory = (EmployeeDirectory*)notification.object;
        self.employees = directory.employees;
    }
    
}

- (void)sortEmployees {
    self.employees = [self.employees sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull firstEmployee, id  _Nonnull secondEmployee) {
        NSString *name1 = [(Employee*)firstEmployee name];
        NSString *name2 = [(Employee*)secondEmployee name];
        return [name1 compare:name2];
    }];
}


#pragma mark - IBActions

- (void)arrangeButtonTap:(UIBarButtonItem *)sender {
    [self sortEmployees];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EmployeeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:employeeCellIdentifier forIndexPath:indexPath];
    Employee *employee = [self.employees objectAtIndex:indexPath.row];
    [cell configureWithEmployee:employee];
    return cell;
}


@end
