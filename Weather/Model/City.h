//
//  City.h
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mantle/MTLModel.h>
#import <Mantle/MTLJSONAdapter.h>

@class Coord;
@class Main;
@class Wind;
@class Clouds;
@class Rain;
@class Snow;
@class Sys;


@interface City : MTLModel<MTLJSONSerializing>


- (id)initWithId:(NSNumber *)identifier name:(NSString *)name;


@property (nonatomic, copy) Coord *coord;
@property (nonatomic, copy) NSArray *weather;
@property (nonatomic, copy) NSString *base;
@property (nonatomic, copy) Main *main;
@property (nonatomic, copy) Wind *wind;
@property (nonatomic, copy) Clouds *clouds;
@property (nonatomic, copy) Rain *rain;
@property (nonatomic, copy) Snow *snow;
@property (nonatomic, copy) NSDate *dt;
@property (nonatomic, copy) Sys *sys;
@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, copy) NSString *name;

@end
