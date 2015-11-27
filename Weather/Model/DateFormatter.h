//
//  DateFormatter.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface DateFormatter : NSObject

@property(strong, nonatomic, readonly) NSDateFormatter *dateFormatter;
@property(strong, nonatomic, readonly) NSValueTransformer *dateTransformer;

+ (DateFormatter *)sharedFormatter;

@end