//
//  City.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "City.h"
#import "DateFormatter.h"

@implementation City

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"coord" : @"coord",
             @"weather" : @"weather",
             @"base" : @"base",
             @"main" : @"main",
             @"wind" : @"wind",
             @"clouds" : @"clouds",
             @"rain" : @"rain",
             @"steps" : @"steps",
             @"snow" : @"snow",
             @"dt" : @"dt",
             @"sys" : @"sys",
             @"id": @"id",
             @"name": @"name",
             @"cod": @"cod"};
    
}

+ (NSValueTransformer *)coordJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Coord class]];
}

+ (NSValueTransformer *)weatherJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Weather class]];
}

+ (NSValueTransformer *)mainJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Main class]];
}

+ (NSValueTransformer *)windJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Wind class]];
}

+ (NSValueTransformer *)cloudsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Clouds class]];
}

+ (NSValueTransformer *)rainJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Rain class]];
}

+ (NSValueTransformer *)snowJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Snow class]];
}

+ (NSValueTransformer *)dtJSONTransformer {
    return [DateFormatter sharedFormatter].dateTransformer;
}

+ (NSValueTransformer *)sysJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Sys class]];
}


@end
