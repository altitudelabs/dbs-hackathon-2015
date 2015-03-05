//
//  MatchViewController.m
//  DBS
//
//  Created by Altitude Labs on 5/3/15.
//  Copyright (c) 2015 DBS. All rights reserved.
//

#import "MatchViewController.h"

@interface MatchViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView* tableView;

@end

@implementation MatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)backBtnClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//}


@end
