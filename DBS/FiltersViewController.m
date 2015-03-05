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
    
    // Search bar
        self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
//    self.searchBar.backgroundColor = [UIColor redColor];
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setDefaultTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1]}];
    [[UILabel appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:[UIColor whiteColor]];
}

- (IBAction)saveClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



@end
