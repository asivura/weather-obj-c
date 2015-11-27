//
// Created by Alexander Sivura on 01.09.15.
// Copyright (c) 2015 My Knowledge Lab. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DateFormatter : NSObject

@property(strong, nonatomic, readonly) NSDateFormatter *dateFormatter;
@property(strong, nonatomic, readonly) NSValueTransformer *dateTransformer;

+ (DateFormatter *)sharedFormatter;

@end