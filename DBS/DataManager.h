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
    kBuyers,
    kSuppliers,
    RoomCount
} Room;

typedef enum {
    kCEO,
    kCTO,
    kCFO,
    kInvestor,
    PositionCount
} Position;

@interface DataManager : NSObject

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
