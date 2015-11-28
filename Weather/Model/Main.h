//
//  Main.h
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mantle/Mantle.h>

@interface Main : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSNumber *temp;
@property (nonatomic, copy) NSNumber *pressure;
@property (nonatomic, copy) NSNumber *humidity;
@property (nonatomic, copy) NSNumber *tempMin;
@property (nonatomic, copy) NSNumber *tempMax;


@end
