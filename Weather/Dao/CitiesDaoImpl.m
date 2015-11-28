//
// Created by Alexander Sivura on 27/11/15.
// Copyright (c) 2015 Alexander Sivura. All rights reserved.
//

#import "CitiesDaoImpl.h"
#import "DatabaseManager.h"
#import "City.h"
#import <YapDatabase/YapDatabaseConnection.h>
#import <YapDatabase/YapDatabaseTransaction.h>
#import <YapDatabase/YapDatabase.h>

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

- (void)saveCities:(NSArray *)cities completion:(dispatch_block_t)block {
    [self.connection asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
        for (City *city in cities) {
            [transaction setObject:city forKey:city.id.stringValue inCollection:dbCitiesCollection];
        }
    } completionBlock:block];

}

- (void)saveCity:(City *)city completion:(dispatch_block_t)block {
    [self saveCities:@[city] completion:block];

}

- (void)deleteCities:(NSArray *)cities completion:(dispatch_block_t)block {
    [self.connection asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
         for(City *city in cities) {
             [transaction removeObjectForKey:city.id.stringValue inCollection:dbCitiesCollection];
         }
    } completionBlock:block];

}

- (void)deleteCity:(City *)city completion:(dispatch_block_t)block {
    [self deleteCities:@[city] completion:block];

}

@end