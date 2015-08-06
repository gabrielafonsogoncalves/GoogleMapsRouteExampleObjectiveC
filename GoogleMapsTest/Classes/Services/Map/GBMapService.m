//
//  GBMapService.m
//  GoogleMapsTest
//
//  Created by Gabriel Alejandro Afonso Goncalves on 7/30/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

#import "GBMapService.h"
#import "GBConstants.h"
#import "GBConnectionService.h"
#import "GBTrip.h"
#import "GBPolyline.h"

@interface GBMapService() <GBConnectionServiceDelegate>

@property (nonatomic, strong) GBConnectionService *connectionService;
@property (nonatomic, strong) id<GBMapServiceDelegate> delegate;

@end

@implementation GBMapService

- (id)initWithDelegate:(id<GBMapServiceDelegate>)delegate
{
    self = [super init];
    if (self) {
        self.connectionService = [[GBConnectionService alloc] init];
        self.delegate = delegate;
    }
    
    return self;
}

- (void)routeFromOrigin:(CLLocationCoordinate2D)origin toDestination:(CLLocationCoordinate2D)destination
{
    NSString *originLatitude = [NSString stringWithFormat:@"%f", origin.latitude];
    NSString *originLongitude = [NSString stringWithFormat:@"%f", origin.longitude];
    NSString *destinationLatitude = [NSString stringWithFormat:@"%f", destination.latitude];
    NSString *destinationLongitude = [NSString stringWithFormat:@"%f", destination.longitude];
    
    NSString *url = [NSString stringWithFormat:@"%@?&origin=%@,%@&destination=%@,%@&sensor=false", kGoogleMapsDirectionsBaseUrl, originLatitude, originLongitude, destinationLatitude, destinationLongitude];
    
    [self.connectionService GETRequestWithURL:url delegate:self];
}

#pragma mark GBConnectionServiceDelegate

- (void)gotResponseObject:(id)response
{
    @try {
        NSDictionary* json = response;
        NSMutableArray *routes = [[NSMutableArray alloc] init];
        for (NSDictionary *route in [json objectForKey:kRoutes]) {
            GBTrip *trip = [self.builder buildObjectForClass:NSStringFromClass([GBTrip class]) fromDictionary:route];
            if (trip) {
                [routes addObject:trip];
            }
        }
        
        GBTrip *trip = routes.firstObject;
        
        if (trip) {
            [self.delegate routeIdFetched:trip.polyline.overviewPolyline];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Error: %@", exception.description);
    }
}

@end