//
//  City.h
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mantle/Mantle.h>
#import "Coord.h"
#import "Weather.h"
#import "Main.h"
#import "Wind.h"
#import "Clouds.h"
#import "Rain.h"
#import "Snow.h"
#import "Sys.h"

@interface City : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) Coord *coord;
@property (nonatomic, copy) Weather *weather;
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
@property (nonatomic, copy) NSNumber *cod;

@end
