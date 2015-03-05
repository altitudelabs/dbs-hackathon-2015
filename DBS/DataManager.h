//
//  DataManager.h
//  DBS
//
//  Created by Justin Yek on 4/3/15.
//  Copyright (c) 2015 DBS. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kGeneralNetworking,
    kFundraising,
    RoomCount
} Room;

typedef enum {
    kCEO,
    PositionCount
} Position;

@interface DataManager : NSObject

// dummy data
@property (nonatomic, strong) NSArray* names;
@property (nonatomic, strong) NSArray* lookingFor;
@property (nonatomic, strong) NSArray* companies;
@property (nonatomic, strong) NSArray* profiles;

// models
@property (nonatomic, strong) NSMutableArray* people;
@property (nonatomic, strong) NSMutableArray* cardStack;

+ (DataManager*) sharedInstance;

- (void) generateProfiles;
- (void) filterCardStackWithRoom:(Room)roomName positions:(NSMutableArray*)positions;
- (NSMutableArray*) getMatches;
- (NSMutableDictionary*) getNextCard;
- (void)swipeRight:(NSDictionary*)person;
- (void)swipeLeft:(NSDictionary*)person;

@end