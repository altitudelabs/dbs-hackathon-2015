//
//  DataManager.m
//  DBS
//
//  Created by Justin Yek on 4/3/15.
//  Copyright (c) 2015 DBS. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

@synthesize people;
@synthesize cardStack;

+ (DataManager*)sharedInstance {
    static DataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DataManager alloc] init];
    });
    
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        [self generateProfiles];
    }
    return self;
}

- (void) generateProfiles {
    int n = 100;
    
    self.people = [[NSMutableArray alloc] initWithCapacity:n];

    for (int i = 0; i < n; i++){
        NSMutableDictionary *person = [[NSMutableDictionary alloc] init];
        [person setObject:@"" forKey:@"profile"];
        [person setObject:@"John Doe" forKey:@"name"];
        [person setObject:[NSNumber numberWithBool: NO] forKey:@"matched"];
        [person setObject:@"500m away" forKey:@"distance"];
        [person setObject:[self getRandomRoom] forKey:@"room"];
        [person setObject:[self getRandomPosition] forKey:@"position"];
        [person setObject:@"ACE Limited" forKey:@"company"];
        [person setObject:@"Looking for investors" forKey:@"lookingFor"];
        [person setObject:@[@"Golf", @"Calligraphy", @"Business", @"Public Speaking"] forKey:@"skills"];
        [person setObject:@"ACE Limited is a supplier for autoparts in the Greater China region" forKey:@"about"];
        
        [self.people addObject:person];
    }
    
    cardStack = self.people;
}

- (void) filterCardStackWithRoom:(Room)room positions:(NSMutableArray*)positions {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(room == %@)", [self getRoomForId:room]];
    self.cardStack = [NSMutableArray arrayWithArray:[people filteredArrayUsingPredicate:pred]];
    NSLog(@"Updated card stack with %lu cards", (unsigned long)self.cardStack.count);
}

- (NSMutableArray*) getMatches {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(matched == %@)", [NSNumber numberWithBool: YES]];
    NSMutableArray *matches = [NSMutableArray arrayWithArray:[people filteredArrayUsingPredicate:pred]];
    NSLog(@"Matches %@", matches);
    return matches;
}

- (NSMutableDictionary*)getNextCard {
    if (self.cardStack.count == 0) return nil;

    NSMutableDictionary *nextCard = [self.cardStack objectAtIndex:self.cardStack.count-1];
    [self.people removeLastObject];
    NSLog(@"Next card: %@", nextCard);
    return nextCard;
}

- (NSUInteger)random:(NSUInteger)max {
    return (NSUInteger) floor(arc4random() % max);
}

- (NSString*)getRandomPosition {
    NSUInteger n = [self random:PositionCount];
    switch (n) {
        case kCEO:
            return @"CEO";
            break;
        case kCTO:
            return @"CTO";
            break;
        case kCFO:
            return @"CFO";
            break;
        case kInvestor:
            return @"Investor";
            break;
        default:
            return @"CEO";
            break;
    }
}

- (NSString*)getRandomRoom {
    Room room = (Room)[self random:RoomCount];
    return [self getRoomForId: room];
}

- (NSString*)getRoomForId:(Room)room {
    switch (room) {
        case kGeneralNetworking:
            return @"General Networking";
            break;
        case kFundraising:
            return @"Fundraising";
            break;
        case kBuyers:
            return @"Buyers";
            break;
        case kSuppliers:
            return @"Suppliers";
            break;
        default:
            return @"General Networking";
            break;
    }
}

- (void)swipeRight:(NSMutableDictionary*)person {
    [person setObject:[NSNumber numberWithBool: YES] forKey:@"matched"];
}

- (void)swipeLeft:(NSMutableDictionary*)person {
    [person setObject:[NSNumber numberWithBool: NO] forKey:@"matched"];
}

@end
