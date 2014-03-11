//
//  CollectionDetailController.m
//  StoreMob
//
//  Created by Tope Abayomi on 06/12/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "CollectionDetailController.h"

@interface CollectionDetailController ()

@end

@implementation CollectionDetailController

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
	
    UIFont* countFont = [UIFont boldSystemFontOfSize:25.0f];
    UIColor* countColor = [UIColor colorWithWhite:0.6f alpha:1.0f];
    
    _titleLabel.font = [UIFont boldSystemFontOfSize:22.0f];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.text = _data[@"name"];

    _likesCountLabel.font = countFont;
    _likesCountLabel.textColor = countColor;
    _likesCountLabel.text = [NSString stringWithFormat:@"%d", [_data[@"likes"] intValue]];

    _viewsCountLabel.font = countFont;
    _viewsCountLabel.textColor = countColor;
    _viewsCountLabel.text = [NSString stringWithFormat:@"%d", [_data[@"views"] intValue]];
    
    _purchasesCountLabel.font = countFont;
    _purchasesCountLabel.textColor = countColor;
    _purchasesCountLabel.text = [NSString stringWithFormat:@"%d", [_data[@"purchases"] intValue]];
    
    UIFont* labelFont = [UIFont boldSystemFontOfSize:14.0f];
    UIColor* labelColor = [UIColor colorWithWhite:0.6f alpha:1.0f];
    
    _likesLabel.font = labelFont;
    _likesLabel.textColor = labelColor;
    _likesLabel.text = @"LIKES";
    
    _viewsLabel.font = labelFont;
    _viewsLabel.textColor = labelColor;
    _viewsLabel.text = @"VIEWS";
    
    _purchasesLabel.font = labelFont;
    _purchasesLabel.textColor = labelColor;
    _purchasesLabel.text = @"PURCHASES";
    
    _productImageView.image = _productImage;
    _productImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    _overlayView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.4f];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
