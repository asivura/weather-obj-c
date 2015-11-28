//
//  Wind.h
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mantle/Mantle.h>

@interface Wind : MTLModel <MTLJSONSerializing>

@property(nonatomic, copy) NSNumber *speed;
@property(nonatomic, copy) NSNumber *deg;

@end
