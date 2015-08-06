//
//  GBPolylineBuilder.m
//  GoogleMapsTest
//
//  Created by Gabriel Alejandro Afonso Goncalves on 7/31/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

#import "GBPolylineBuilder.h"
#import "GBConstants.h"
#import "GBPolyline.h"

@implementation GBPolylineBuilder

- (id)buildFromDictionary:(NSDictionary *)dictionary
{
    if (!dictionary) {
        return nil;
    }
    
    GBPolyline *polyline = [[GBPolyline alloc] init];
    polyline.overviewPolyline = dictionary[kPoints];
    
    return polyline;
}

@end
