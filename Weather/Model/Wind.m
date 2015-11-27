//
//  Wind.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "Wind.h"

@implementation Wind

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"speed" : @"speed",
             @"deg" : @"deg"};
    
}

@end
