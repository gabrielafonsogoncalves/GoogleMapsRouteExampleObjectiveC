//
//  GBBuilder.m
//  GoogleMapsTest
//
//  Created by Gabriel Alejandro Afonso Goncalves on 7/30/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

#import "GBBuilder.h"
#import "GBTripBuilder.h"
#import "GBTrip.h"
#import "GBPolylineBuilder.h"
#import "GBPolyline.h"

@interface GBBuilder ()

@property (nonatomic, strong) NSMutableDictionary *builders;
@property (nonatomic) Boolean loaded;

@end

@implementation GBBuilder

- (id)buildObjectForClass:(NSString *)className fromDictionary:(NSDictionary *)dictionary
{
    if (!dictionary) {
        return nil;
    }
    
    if (!self.loaded) {
        [self loadBuilders];
    }
    
    id<GBObjectBuilder> builder = self.builders[className];
    if (builder) {
        return [builder buildFromDictionary:dictionary];
    }
    
    return nil;
}

- (void)loadBuilders
{
    self.builders = [NSMutableDictionary new];
    
    GBTripBuilder *tripBuilder = [GBTripBuilder new];
    tripBuilder.context = self;
    [self.builders setObject:tripBuilder forKey:NSStringFromClass([GBTrip class])];
    
    GBPolylineBuilder *polylineBuilder = [GBPolylineBuilder new];
    polylineBuilder.context = self;
    [self.builders setObject:polylineBuilder forKey:NSStringFromClass([GBPolyline class])];

    self.loaded = YES;
}

@end
