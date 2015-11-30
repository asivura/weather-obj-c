//
// Created by Alexander Sivura on 29/11/15.
// Copyright (c) 2015 Alexander Sivura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YapDatabase/YapDatabaseConnection.h>

@protocol FetchedObjectControllerDelegate;


@interface FetchedObjectController : NSObject

@property (nonatomic, weak) id<FetchedObjectControllerDelegate> delegate;

- (id) initWithConnection:(YapDatabaseConnection *)connection key:(NSString *) key collection:(NSString *)collection;

- (id)object;
@end

@protocol FetchedObjectControllerDelegate <NSObject>

- (void)controllerDidChangeContent:(FetchedObjectController *)controller;


@end
