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
        NSString *companyName = [self getRandomCompany];
        
        NSMutableDictionary *person = [[NSMutableDictionary alloc] init];
        [person setObject:[NSNumber numberWithInt:i] forKey:@"id"];
        [person setObject:[self getRandomImageUrl] forKey:@"profile"];
        [person setObject:[self getRandomName] forKey:@"name"];
        [person setObject:[NSNumber numberWithBool: NO] forKey:@"matched"];
        [person setObject:[self getRandomDistance] forKey:@"distance"];
        [person setObject:[self getRandomRoom] forKey:@"room"];
        [person setObject:[self getRandomPosition] forKey:@"position"];
        [person setObject:companyName forKey:@"company"];
        [person setObject:[self getRandomRating] forKey:@"lookingFor"];
        [person setObject:[self getRandomInterests] forKey:@"interests"];
        [person setObject:[self getRandomCompanyDescription:companyName] forKey:@"about"];
        
        [self.people addObject:person];
    }
    
    self.cardStack = [self.people mutableCopy];
}

- (void) filterCardStackWithRoom:(Room)room positions:(NSMutableArray*)positions {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(room == %@)", [self getRoomById:room]];
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
    [self.cardStack removeLastObject];
    NSLog(@"Next card: %@", nextCard);
    return nextCard;
}

- (NSUInteger)random:(NSUInteger)max {
    return (NSUInteger) floor(arc4random() % max);
}

- (NSString*)getRandomPosition {
    NSArray *data = @[@"Hong Kong", @"Shenzhen", @"Shanghai", @"Guangdong", @"Taipei", @"Beijing", @"Tianjin", @"Xiamen", @"Dongguan"];
    
    return [NSString stringWithFormat:@"%@", [data objectAtIndex:[self random:data.count]]];
}

- (NSString*)getRandomRoom {
    Room room = (Room)[self random:RoomCount];
    return [self getRoomById: room];
}

- (NSString*)getRoomById:(Room)room {
    switch (room) {
        case kGeneralNetworking:
            return @"General Networking";
            break;
        case kFundraising:
            return @"Fundraising";
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

- (NSString*)getRandomName {
    NSArray *firstNames = @[@"Gilbert", @"Christian", @"Hyman", @"Walker", @"Whitney", @"Shelton", @"Bruce", @"Isaias", @"Wilburn", @"Todd", @"Merrill", @"Josue", @"Shannon", @"Elroy", @"Donn", @"Carlo", @"Marcos", @"Carlos", @"Wiley", @"Frederick", @"Jesse", @"Basil", @"Jewell", @"Benton", @"Luis", @"Norbert", @"Kelvin", @"Lorenzo", @"Leroy", @"Tyrell", @"Robt", @"Coy", @"Darrin", @"Jarred", @"Hans", @"Wade", @"Osvaldo", @"Stephen", @"Angelo", @"Chi", @"Preston", @"Craig", @"Sherman", @"Millard", @"Elmer", @"Bennett", @"Jerrold", @"Quincy", @"Kory", @"Zachary"];
    
    NSArray *lastNames = @[@"Chen", @"Li", @"Lee", @"Zhang", @"Ye", @"Liu", @"Wang", @"Wong", @"Chiu", @"Ma", @"Wu", @"Ho", @"Lo", @"Lim", @"Pang", @"Tung", @"Poon", @"Zheng", @"Liu"];
    
    return [NSString stringWithFormat:@"%@ %@", [firstNames objectAtIndex:[self random:firstNames.count]], [lastNames objectAtIndex:[self random:lastNames.count]]];
}

- (NSString*)getRandomCompany {
    NSArray *companyName = @[@"Gilbert", @"Christian", @"Hyman", @"Walker", @"Whitney", @"Shelton", @"Bruce", @"Isaias", @"Wilburn", @"Todd", @"Merrill", @"Josue", @"Shannon", @"Elroy", @"Donn", @"Carlo", @"Marcos", @"Carlos", @"Wiley", @"Frederick", @"Jesse", @"Basil", @"Jewell", @"Benton", @"Luis", @"Norbert", @"Kelvin", @"Lorenzo", @"Leroy", @"Tyrell", @"Robt", @"Coy", @"Darrin", @"Jarred", @"Hans", @"Wade", @"Osvaldo", @"Stephen", @"Angelo", @"Chi", @"Preston", @"Craig", @"Sherman", @"Millard", @"Elmer", @"Bennett", @"Jerrold", @"Quincy", @"Kory", @"Zachary"];
    
    NSArray *companySuffix = @[@"Pte Ltd", @"Limited", @"Group", @"Corporation", @"and Co", @"Trading", @"Services"];
    
    return [NSString stringWithFormat:@"%@ %@", [companyName objectAtIndex:[self random:companyName.count]], [companySuffix objectAtIndex:[self random:companySuffix.count]]];
}

- (NSString*)getRandomDistance {
    NSUInteger d = [self random:50];
    
    if (d < 20){
        return [NSString stringWithFormat:@"%lu00m", d];
    } else {
        return [NSString stringWithFormat:@"%lukm", d];
    }
}

- (NSString*)getRandomCompanyDescription:(NSString*)companyName {
    NSArray *type = @[@"is a sportswear company", @"is a winter sports manufacturer", @"is a running shoe manufacturer"];
    
    NSArray *area = @[@"in Taiwan.", @"in Shenzhen.", @"in Hong Kong.", @"in Hong Kong, Korea and Japan.", @"in Beijing.", @"in Shanghai.", @"in Taipei.", @"in Kowloon.", @"in Guangdong and Hong Kong."];
    
    return [NSString stringWithFormat:@"%@ %@ %@", companyName, [type objectAtIndex:[self random:type.count]], [area objectAtIndex:[self random:area.count]]];
}

- (NSArray*)getRandomInterests {
    NSMutableArray *data = [NSMutableArray arrayWithArray:@[@"Bikes", @"Tennis", @"Badminton", @"Tents", @"Shoes", @"Hiking", @"Skiing", @"Trekking", @"Swimming", @"Football", @"Rugby", @"Handball", @"Golf"]];
    
    NSUInteger n = [self random: 5];
    
    NSMutableArray *interests = [[NSMutableArray alloc] initWithCapacity:n];
    
    for (int i = 0; i < n; i++){
        NSUInteger selected = [self random:data.count];
        [interests addObject:[data objectAtIndex:selected]];
        [data removeObjectAtIndex:selected];
    }
    
    return interests;
}

- (NSString*)getRandomRating {
    double rating = (double)[self random: 50]/10;
    NSUInteger numberOfPeople = [self random: 200];
    
    NSNumberFormatter *doubleValueWithMaxTwoDecimalPlaces = [[NSNumberFormatter alloc] init];
    [doubleValueWithMaxTwoDecimalPlaces setNumberStyle:NSNumberFormatterDecimalStyle];
    [doubleValueWithMaxTwoDecimalPlaces setMaximumFractionDigits:2];
    
    return [NSString stringWithFormat:@"%@/5.0 (%lu Ratings)", [doubleValueWithMaxTwoDecimalPlaces stringFromNumber:[NSNumber numberWithDouble:rating]], numberOfPeople];
}

- (NSString*)getRandomImageUrl {
    NSUInteger n = [self random: 30];
    
    return [NSString stringWithFormat:@"%lu.jpg", (unsigned long)n];
}

@end