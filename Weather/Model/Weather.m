//
//  Weather.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "Weather.h"

@implementation Weather

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"id" : @"id",
             @"main" : @"main",
             @"descr" : @"description",
             @"icon" : @"icon"};
    
}

@end
