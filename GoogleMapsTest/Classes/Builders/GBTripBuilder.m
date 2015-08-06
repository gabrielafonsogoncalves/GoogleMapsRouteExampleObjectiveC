//
//  GBTripBuilder.m
//  GoogleMapsTest
//
//  Created by Gabriel Alejandro Afonso Goncalves on 7/30/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

#import "GBTripBuilder.h"
#import "GBConstants.h"
#import "GBTrip.h"
#import "GBPolyline.h"

@implementation GBTripBuilder

- (id)buildFromDictionary:(NSDictionary *)dictionary
{
    if (!dictionary) {
        return nil;
    }
    
    GBPolyline *polyline = [self.context buildObjectForClass:NSStringFromClass([GBPolyline class]) fromDictionary:dictionary[kOverviewPolyline]];
    GBTrip *trip = [[GBTrip alloc] init];
    trip.summary = dictionary[kSummary];
    trip.polyline = polyline;
    
    return trip;
}

@end
