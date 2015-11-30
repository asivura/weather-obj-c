//
//  City.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "City.h"
#import "DateFormatter.h"
#import "Coord.h"
#import "Main.h"
#import "Wind.h"
#import "Clouds.h"
#import "Rain.h"
#import "Snow.h"
#import "FetchedObjectController.h"
#import "Sys.h"
#import "Weather.h"

@implementation City

- (id)initWithId:(NSNumber *)identifier name:(NSString *)name {
    self = [super init];
    if (self) {
        self.id = identifier;
        self.name = name;
    }

    return self;
}


+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"coord" : @"coord",
            @"weather" : @"weather",
            @"base" : @"base",
            @"main" : @"main",
            @"wind" : @"wind",
            @"clouds" : @"clouds",
            @"rain" : @"rain",
            @"snow" : @"snow",
            @"dt" : @"dt",
            @"sys" : @"sys",
            @"id" : @"id",
            @"name" : @"name"};

}

+ (NSValueTransformer *)coordJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Coord class]];
}

+ (NSValueTransformer *)weatherJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Weather class]];
}

+ (NSValueTransformer *)mainJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Main class]];
}

+ (NSValueTransformer *)windJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Wind class]];
}

+ (NSValueTransformer *)cloudsJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Clouds class]];
}

+ (NSValueTransformer *)rainJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Rain class]];
}

+ (NSValueTransformer *)snowJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Snow class]];
}

+ (NSValueTransformer *)dtJSONTransformer {
    return [DateFormatter sharedFormatter].dateTransformer;
}

+ (NSValueTransformer *)sysJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Sys class]];
}


@end
