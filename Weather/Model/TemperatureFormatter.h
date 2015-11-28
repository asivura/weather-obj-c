//
//  TemperatureFormatter.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface TemperatureFormatter : NSObject

@property(strong, nonatomic, readonly) NSValueTransformer *temperatureTransformer;

+ (TemperatureFormatter *)sharedFormatter;

@end