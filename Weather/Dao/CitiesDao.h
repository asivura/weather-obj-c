//
// Created by Alexander Sivura on 27/11/15.
// Copyright (c) 2015 Alexander Sivura. All rights reserved.
//

#import <Foundation/Foundation.h>

@class City;

@protocol CitiesDao <NSObject>

- (void)saveCities:(NSArray *)cities completion:(dispatch_block_t) block;
- (void)saveCity:(City *)city completion:(dispatch_block_t) block;
- (void)deleteCities:(NSArray *)cities completion:(dispatch_block_t) block;
- (void)deleteCity:(City *)city completion:(dispatch_block_t) block;

@end