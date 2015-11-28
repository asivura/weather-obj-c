//
// Created by Alexander Sivura on 01.09.15.
// Copyright (c) 2015 My Knowledge Lab. All rights reserved.
//

#import <Mantle/MTLValueTransformer.h>
#import "TemperatureFormatter.h"

@interface TemperatureFormatter ()

@property (strong, nonatomic, readwrite) NSDateFormatter *dateFormatter;
@property (strong, nonatomic, readwrite) NSValueTransformer *dateTransformer;

@end

@implementation TemperatureFormatter
+ (TemperatureFormatter *)sharedFormatter {
    static TemperatureFormatter *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}



- (NSValueTransformer *)dateTransformer {
    if (!_dateTransformer) {
        _dateTransformer = [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
            return nil;
        } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
            return [NSString stringWithFormat:@"%lf", date.timeIntervalSince1970];;
        }];
    }
    return _dateTransformer;
}

@end