//
//  ViewController.m
//  GoogleMapsTest
//
//  Created by Gabriel Alejandro Afonso Goncalves on 7/29/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

#import "MapViewController.h"
#import "GBMapService.h"

@import GoogleMaps;

@interface MapViewController () <GBMapServiceDelegate, GMSMapViewDelegate>

@property (nonatomic, strong) GMSMapView *mapView;
@property (nonatomic, strong) GBMapService *mapService;
@property (nonatomic) CLLocationCoordinate2D origin;
@property (nonatomic) CLLocationCoordinate2D destination;

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareGoogleMaps];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark Private methods

- (void)prepareGoogleMaps
{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86 longitude:151.20 zoom:12];
    self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.mapView.myLocationEnabled = YES;
    self.mapView.delegate = self;
    self.view = self.mapView;

    if (!self.mapService) {
        self.mapService = [[GBMapService alloc] initWithDelegate:self];
    }
    
    self.origin = CLLocationCoordinate2DMake(-33.86, 151.20);
    self.destination = CLLocationCoordinate2DMake(-33.86, 150.0);
    
    [self.mapService routeFromOrigin:self.origin toDestination:self.destination];
}

#pragma mark GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    self.destination = coordinate;
    [self.mapService routeFromOrigin:self.origin toDestination:coordinate];
}

#pragma mark GBMapServiceDelegate

- (void)routeIdFetched:(NSString *)routeId
{
    if (!routeId || [@"" isEqualToString:routeId]) {
        return;
    }
    
    CLLocationCoordinate2D position = CLLocationCoordinate2DMake(self.origin.latitude, self.origin.longitude);
    GMSMarker *marker = [GMSMarker markerWithPosition:position];
    marker.map = self.mapView;
    
    CLLocationCoordinate2D position1 = CLLocationCoordinate2DMake(self.destination.latitude, self.destination.longitude);
    GMSMarker *marker1 = [GMSMarker markerWithPosition:position1];
    marker1.map = self.mapView;
    
    GMSPath *path = [GMSPath pathFromEncodedPath:routeId];
    GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    
    polyline.strokeColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];;
    polyline.strokeWidth = 5.f;
    polyline.map = self.mapView;
}

@end