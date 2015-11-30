//
// Created by Alexander Sivura on 29/11/15.
// Copyright (c) 2015 Alexander Sivura. All rights reserved.
//

#import "FetchedObjectController.h"
#import <YapDatabase/YapDatabase.h>

@interface FetchedObjectController()

@property(nonatomic, strong) YapDatabaseConnection *connection;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *collection;

@end

@implementation FetchedObjectController
- (id)initWithConnection:(YapDatabaseConnection *)connection key:(NSString *) key collection:(NSString *)collection {

    self = [super init];
    if (self) {
        self.connection = connection;
        self.key = key;
        self.collection = collection;

        [self.connection beginLongLivedReadTransaction];

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(yapDatabaseModified:)
                                                     name:YapDatabaseModifiedNotification
                                                   object:self.connection.database];
    }
    return self;

}

- (void)yapDatabaseModified:(NSNotification *)notification {

    NSArray *notifications = [self.connection beginLongLivedReadTransaction];

    if([self.connection hasChangeForKey:self.key inCollection:self.collection inNotifications:notifications]) {
        [self.delegate controllerDidChangeContent:self];
    };


}

- (id)object {
    __block id result = nil;
    [self.connection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        result = [transaction objectForKey:self.key inCollection:self.collection];
    }];
    return result;
}

@end