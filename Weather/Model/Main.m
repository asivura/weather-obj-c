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
             @"pressure" : @"pressure",
             @"temp_min" : @"tempMin",
             @"temp_max" : @"tempMax"};
}

@end
