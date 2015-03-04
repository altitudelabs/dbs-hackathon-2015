//
//  ViewController.m
//  DBS
//
//  Created by Altitude Labs on 4/3/15.
//  Copyright (c) 2015 DBS. All rights reserved.
//

#import "ViewController.h"
#import "DataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableDictionary *person1 = [[DataManager sharedInstance] getNextCard];
    [[DataManager sharedInstance] swipeRight: person1];
    
    [[DataManager sharedInstance] filterCardStackWithRoom:kFundraising positions:nil];

    NSMutableDictionary *person2 = [[DataManager sharedInstance] getNextCard];
    [[DataManager sharedInstance] swipeRight: person2];
    
    [[DataManager sharedInstance] getMatches];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
