//
// Created by Alexander Sivura on 01.09.15.
// Copyright (c) 2015 My Knowledge Lab. All rights reserved.
//

#import <Mantle/MTLValueTransformer.h>
#import "DateFormatter.h"

@interface DateFormatter ()

@property (strong, nonatomic, readwrite) NSDateFormatter *dateFormatter;
@property (strong, nonatomic, readwrite) NSValueTransformer *dateTransformer;

@end

@implementation DateFormatter
+ (DateFormatter *)sharedFormatter {
    static DateFormatter *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (NSDateFormatter *)dateFormatter {
    if (!_dateFormatter) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
        formatter.dateFormat = @"yyyy-MM-dd' 'HH:mm:ss.SSSS";
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        _dateFormatter = formatter;
    }
    return _dateFormatter;
}

- (NSValueTransformer *)dateTransformer {
    if (!_dateTransformer) {
        _dateTransformer = [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
            return [self.dateFormatter dateFromString:dateString];
        } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
            return [self.dateFormatter stringFromDate:date];
        }];
    }
    return _dateTransformer;
}

@end