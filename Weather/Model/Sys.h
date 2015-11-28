//
//  Sys.h
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mantle/MTLModel.h>
#import <Mantle/MTLJSONAdapter.h>

@interface Sys : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSNumber *type;
@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, copy) NSNumber *message;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSDate *sunrise;
@property (nonatomic, copy) NSDate *sunset;

@end
