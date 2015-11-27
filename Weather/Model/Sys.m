//
//  Sys.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "Sys.h"
#import "DateFormatter.h"

@implementation Sys

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"type" : @"type",
             @"id" : @"id",
             @"message" : @"message",
             @"country" : @"country",
             @"sunrise" : @"sunrise",
             @"sunset" : @"sunset"};
    
}

+ (NSValueTransformer *)sunriseJSONTransformer {
    return [DateFormatter sharedFormatter].dateTransformer;
}

+ (NSValueTransformer *)sunsetJSONTransformer {
    return [DateFormatter sharedFormatter].dateTransformer;
}

@end
