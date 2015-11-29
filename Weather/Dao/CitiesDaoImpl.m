//
// Created by Alexander Sivura on 27/11/15.
// Copyright (c) 2015 Alexander Sivura. All rights reserved.
//

#import "CitiesDaoImpl.h"
#import "DatabaseManager.h"
#import "City.h"
#import "FetchedResultsController.h"
#import <YapDatabase/YapDatabaseConnection.h>
#import <YapDatabase/YapDatabaseTransaction.h>
#import <YapDatabase/YapDatabase.h>
#import <YapDatabase/YapDatabaseViewMappings.h>

@interface  CitiesDaoImpl()

@property (strong, nonatomic) YapDatabaseConnection *connection;

@end

@implementation CitiesDaoImpl

- (YapDatabaseConnection *)connection {
    if (!_connection) {
        _connection = [self.dbManager.db newConnection];
    }

    return _connection;
}

- (FetchedResultsController *)fetchedResultsController {
    YapDatabaseViewMappings *mappings = [[YapDatabaseViewMappings alloc] initWithGroups:@[@""] view:dbCitiesView];
    return [[FetchedResultsController alloc] initWithConnection:[self.dbManager.db newConnection] mappings:mappings];
}

- (void)getAllKeysWithCompletion:(void (^)(NSArray *keys))block {
    __block NSArray *result = nil;
    [self.connection asyncReadWithBlock:^(YapDatabaseReadTransaction *transaction) {
        result = [transaction allKeysInCollection:dbCitiesCollection];
    } completionBlock:^{
        block(result);
    }];
}

- (void)saveAll:(NSArray *)cities completion:(dispatch_block_t)block {
    [self.connection asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
        for (City *city in cities) {
            [transaction setObject:city forKey:city.id.stringValue inCollection:dbCitiesCollection];
        }
    } completionBlock:block];

}

- (void)save:(City *)city completion:(dispatch_block_t)block {
    [self saveAll:@[city] completion:block];

}

- (void)removeAll:(NSArray *)cities completion:(dispatch_block_t)block {
    [self.connection asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
         for(City *city in cities) {
             [transaction removeObjectForKey:city.id.stringValue inCollection:dbCitiesCollection];
         }
    } completionBlock:block];

}

- (void)remove:(City *)city completion:(dispatch_block_t)block {
    [self removeAll:@[city] completion:block];

}

@end