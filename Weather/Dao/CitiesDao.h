//
// Created by Alexander Sivura on 27/11/15.
// Copyright (c) 2015 Alexander Sivura. All rights reserved.
//

#import <Foundation/Foundation.h>

@class City;

@protocol CitiesDao <NSObject>

- (void)getAllKeysWithCompletion:(void (^)(NSArray *keys))block;

- (void)saveAll:(NSArray *)cities completion:(dispatch_block_t) block;
- (void)save:(City *)city completion:(dispatch_block_t) block;
- (void)removeAll:(NSArray *)cities completion:(dispatch_block_t) block;
- (void)remove:(City *)city completion:(dispatch_block_t) block;

@end