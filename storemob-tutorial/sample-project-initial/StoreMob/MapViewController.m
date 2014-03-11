//
//  MapViewController.m
//  StoreMob
//
//  Created by Tope Abayomi on 06/12/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "MapViewController.h"
#import "Location.h"

#define METERS_PER_MILE 1609.344

@interface MapViewController ()

@property (nonatomic, strong) NSArray *arrCollectionsData;

@end

@implementation MapViewController

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
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 51.5072;
    zoomLocation.longitude= -0.1275;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 20*METERS_PER_MILE, 20*METERS_PER_MILE);
    
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    [_mapView setRegion:adjustedRegion animated:YES];

    self.navigationItem.title = @"LOCATIONS";
    [self getCollectionsData];
}


-(void)loadCollectionsOnMap{
    
    for (NSDictionary* item in _arrCollectionsData) {
        
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = [item[@"latitude"] doubleValue];
        coordinate.longitude = [item[@"longitude"] doubleValue];
        
        
        Location* location = [[Location alloc] init];
        location.title = item[@"name"];
        location.coordinate = coordinate;
        
        [_mapView addAnnotation:location];
    }
    
}

-(void)getCollectionsData{
    // Specify the data URL.
    NSURL *url = [NSURL URLWithString:@"http://www.appdesignvault.com/downloads/storemob/storemob.json"];
    
    // Use a NSURLSession session to get the data in combination with a NSURLSessionDataTask object.
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            // In case any error occurs just log a message along with a description of the error.
            NSLog(@"An error occured while getting Collections data.");
            NSLog(@"%@", [error localizedDescription]);
        }
        else{
            NSError *jsonError;
            
            // Get a dictionary from the downloaded JSON data, using the NSJSONSerialization class.
            NSDictionary *jsonDataDict = [NSJSONSerialization JSONObjectWithData:data
                                                                         options:kNilOptions
                                                                           error:&jsonError];
            
            if (jsonError) {
                // If an error occured while converting JSON data into a NSDictionary object then log a message
                // along with the error description.
                NSLog(@"Unable to convert JSON data.");
                NSLog(@"%@", [jsonError localizedDescription]);
            }
            else{
                // Initialize the _arrCollectionsData array with contents the array of the "items" key, of
                // the dictionary object.
                _arrCollectionsData = [[NSArray alloc] initWithArray:jsonDataDict[@"items"]];
                
                // As NSURLSession tasks are asynchronous, reload the data of the collection view using the main thread.
                // Do that right now to allow any downloaded data to appear until all images are downloaded too.
                
                [self performSelectorOnMainThread:@selector(loadCollectionsOnMap) withObject:nil waitUntilDone:YES];
                
            } // else
        } // else
    }];
    
    // Begin downloading the JSON data.
    [task resume];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
