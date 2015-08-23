//
//  FISAppDelegate.m
//  ApplesAndHolidays
//
//  Created by Al Tyus on 5/30/14.
//  Copyright (c) 2014 com.flatironschool. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}


- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"SELF == %@", @"apple"];
    NSArray *apples = [fruits filteredArrayUsingPredicate:applePredicate];
    return apples;
}


- (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *holidays = database[season];
    return holidays;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *supplies = database[season][holiday];
    return supplies;
}

- (BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
     NSArray *holidays = [database[season] allKeys];
    return [holidays containsObject:holiday];
}

- (BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *supplies = database[season][holiday];
    return [supplies containsObject:supply];
}

- (NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableDictionary *mDatabase = [database mutableCopy];
    [mDatabase[season] setObject:@[] forKey:holiday];
    return mDatabase;
}

- (NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableDictionary *mDatabase = [database mutableCopy];
    [mDatabase[season][holiday] addObject:supply];
    return mDatabase;
}

@end