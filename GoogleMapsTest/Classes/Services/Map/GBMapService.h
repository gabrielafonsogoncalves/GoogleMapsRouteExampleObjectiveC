//
//  GBMapService.h
//  GoogleMapsTest
//
//  Created by Gabriel Alejandro Afonso Goncalves on 7/30/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBAbstractService.h"

@import GoogleMaps;

@protocol GBMapServiceDelegate <NSObject>

- (void)routeIdFetched:(NSString *)routeId;

@end

@interface GBMapService: GBAbstractService

- (id)initWithDelegate:(id<GBMapServiceDelegate>)delegate;
- (void)routeFromOrigin:(CLLocationCoordinate2D)origin toDestination:(CLLocationCoordinate2D)destination;

@end
