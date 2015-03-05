//
//  FiltersViewController.m
//  DBS
//
//  Created by Altitude Labs on 5/3/15.
//  Copyright (c) 2015 DBS. All rights reserved.
//

#import "FiltersViewController.h"

@interface FiltersViewController ()

@end

@implementation FiltersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 10; i <= 15; i++) {
        UISwitch *sss = (UISwitch *)[self.bgView viewWithTag:i];
        [sss setOnTintColor:[UIColor colorWithRed:206.0/255.0 green:36.0/255.0 blue:43.0/255.0 alpha:1]];
    }
}

- (IBAction)saveClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



@end
