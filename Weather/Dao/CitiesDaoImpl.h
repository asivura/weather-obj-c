//
// Created by Alexander Sivura on 27/11/15.
// Copyright (c) 2015 Alexander Sivura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CitiesDao.h"

@class DatabaseManager;


@interface CitiesDaoImpl : NSObject<CitiesDao>


@property (nonatomic, strong) DatabaseManager *dbManager;

@end