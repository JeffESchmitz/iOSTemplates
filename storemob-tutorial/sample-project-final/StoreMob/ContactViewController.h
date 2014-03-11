//
//  ContactViewController.h
//  StoreMob
//
//  Created by Tope Abayomi on 06/12/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ContactViewController : UIViewController

@property (nonatomic, weak) IBOutlet MKMapView* mapView;

@property (nonatomic, weak) IBOutlet UILabel* contactLabel;

@property (nonatomic, weak) IBOutlet UILabel* addressLabel;

@property (nonatomic, weak) IBOutlet UILabel* telephoneLabel;

@property (nonatomic, weak) IBOutlet UILabel* emailLabel;

@property (nonatomic, weak) IBOutlet UITextView* addressTextView;

@end
