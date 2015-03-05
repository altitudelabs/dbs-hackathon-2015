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
    [self setData];
}

- (void)setup {
    dataManager = [DataManager sharedInstance];
    person = [dataManager getNextCard];
}

- (void)setData {
     NSLog(@"person card: %@", person);
    self.name.text = person[@"name"];
    self.jobTitle.text = person[@"position"];
    self.hobby.text = person[@"lookingFor"];
    self.aboutDetail.text = person[@"about"];
    self.imgView.image = [UIImage imageNamed:person[@"profile"]];
    
    // tags
    for (int i = 0; i < 8; i++) {
        int tagNum = 11 + i;
        UIButton *btn = (UIButton *)[self.bgView viewWithTag:tagNum];
        btn.hidden = YES;
    }
    
    NSArray *interests = person[@"interests"];
    for (int i = 0; i < interests.count; i++) {
        int tagNum = 11 + i;
        UIButton *btn = (UIButton *)[self.bgView viewWithTag:tagNum];
        btn.hidden = NO;
        [btn setTitle:interests[i] forState:UIControlStateNormal];
    }
    
    // At least 1 tag
    if (interests.count == 0) {
        UIButton *btn = (UIButton *)[self.bgView viewWithTag:11];
        btn.hidden = NO;
    }
}

- (void)swipeRight {
    //[dataManager swipeRight:person];
}

- (void)swipeLeft {
    //[dataManager swipeLeft:person];
}


@end
