//
//  Rain.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "Rain.h"

@implementation Rain

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"3h" : @"volume3h"};
}

@end
