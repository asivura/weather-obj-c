//
//  Main.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "Main.h"

@implementation Main

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"temp" : @"temp",
             @"humidity" : @"humidity",
             @"pressure" : @"pressure",
             @"tempMin" : @"temp_min",
             @"tempMax" : @"temp_max"};
}

@end
