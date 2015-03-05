//
//  ProfileContentViewController.m
//  DBS
//
//  Created by Altitude Labs on 4/3/15.
//  Copyright (c) 2015 DBS. All rights reserved.
//

#import "ProfileContentViewController.h"
#import "DataManager.h"

@interface ProfileContentViewController ()
@property (nonatomic, strong) DataManager *dataManager;
@property (nonatomic, strong) NSMutableDictionary *person;

@end

@implementation ProfileContentViewController
@synthesize dataManager;
@synthesize person;

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)setup {
    dataManager = [DataManager sharedInstance];
    person = [dataManager getNextCard];
    NSLog(@"person card: %@", person);
}

- (void)swipeRight {
    //[dataManager swipeRight:person];
}

- (void)swipeLeft {
    //[dataManager swipeLeft:person];
}


@end
