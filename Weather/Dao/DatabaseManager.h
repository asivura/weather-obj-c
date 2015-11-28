//
//  DatabaseManager.h
//  Weather
//
//  Created by Alexander Sivura on 27/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YapDatabase;

extern NSString *const dbCitiesCollection;
extern NSString *const dbCitiesView;


@interface DatabaseManager : NSObject

@property (strong, nonatomic, readonly) YapDatabase *db;

- (id)initWithDbName:(NSString *)dbName;

@end
