//
//  Coord.h
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Coord : MTLModel<MTLJSONSerializing>

@property(nonatomic, copy) NSNumber *lon;
@property(nonatomic, copy) NSNumber *lat;

@end
