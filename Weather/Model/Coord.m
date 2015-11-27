//
//  Coord.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "Coord.h"

@implementation Coord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"lat" : @"lat",
             @"lon" : @"lon"};
    
}

@end
