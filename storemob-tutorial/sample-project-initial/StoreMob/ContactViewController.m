//
//  ContactViewController.m
//  StoreMob
//
//  Created by Tope Abayomi on 06/12/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "ContactViewController.h"
#import "Location.h"

#define METERS_PER_MILE 1609.344

@interface ContactViewController ()

@end

@implementation ContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _contactLabel.text = @"CONTACT US";
    _addressLabel.text = @"12 Regent Street \n W1 3WE \n London";
    _telephoneLabel.text = @"Tel: 0208 929 1039";
    _emailLabel.text = @"Email: info@fashionhouse.com";
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 51.5072;
    zoomLocation.longitude= -0.1275;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, METERS_PER_MILE, METERS_PER_MILE);
    
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    [_mapView setRegion:adjustedRegion animated:YES];
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 51.5072;
    coordinate.longitude = -0.1275;
    Location* location = [[Location alloc] init];
    location.title = @"Contact Us";
    location.coordinate = coordinate;
    
    [_mapView addAnnotation:location];
    
    self.navigationItem.title = @"CONTACT US";
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
