//
//  DatabaseManager.m
//  Weather
//
//  Created by Alexander Sivura on 27/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "DatabaseManager.h"
#import <YapDatabase/YapDatabaseView.h>
#import <YapDatabase/YapDatabase.h>

NSString *const dbCitiesCollection = @"citiesCollection";
NSString *const dbCitiesView = @"citiesView";

@interface DatabaseManager ()
@property(strong, nonatomic, readwrite) YapDatabase *db;
@end

@implementation DatabaseManager
- (id)initWithDbName:(NSString *)dbName {
    self = [super init];
    if (self) {
        [self setupDatabase:dbName];

    }

    return self;
}

- (void)setupDatabase:(NSString *)dbName {
    NSString *dbPath = [[self class] dbPathWithDbName:dbName];
    self.db = [[YapDatabase alloc] initWithPath:dbPath];
    [self.db registerExtension:[self citiesView] withName:dbCitiesView];

}

- (YapDatabaseView *)citiesView {
    YapDatabaseViewGrouping *grouping = [YapDatabaseViewGrouping withKeyBlock:^NSString *(YapDatabaseReadTransaction *transaction, NSString *collection, NSString *key) {
        if (![collection isEqualToString:dbCitiesCollection]) {
            return nil;
        }
        return @"";
    }];

    YapDatabaseViewSorting *sorting = [YapDatabaseViewSorting withKeyBlock:^NSComparisonResult(YapDatabaseReadTransaction *transaction, NSString *group, NSString *collection1, NSString *key1, NSString *collection2, NSString *key2) {
        return [key1 compare:key2];
    }];

    return [[YapDatabaseView alloc] initWithGrouping:grouping sorting:sorting];
}

+ (NSString *)dbPathWithDbName:(NSString *)dbName {

    NSURL *baseURL = [[NSFileManager defaultManager] URLForDirectory:NSApplicationSupportDirectory
                                                            inDomain:NSUserDomainMask
                                                   appropriateForURL:nil
                                                              create:YES
                                                               error:NULL];

    NSURL *dbUrl = [baseURL URLByAppendingPathComponent:dbName isDirectory:NO];

    return dbUrl.filePathURL.path;
}


@end
