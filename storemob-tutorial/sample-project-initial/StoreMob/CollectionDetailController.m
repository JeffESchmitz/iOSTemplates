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
    
    _titleLabel.text = _data[@"name"];
    _likesCountLabel.text = [NSString stringWithFormat:@"%d", [_data[@"likes"] intValue]];
    _viewsCountLabel.text = [NSString stringWithFormat:@"%d", [_data[@"views"] intValue]];
    _purchasesCountLabel.text = [NSString stringWithFormat:@"%d", [_data[@"purchases"] intValue]];
    
    _likesLabel.text = @"LIKES";
    _viewsLabel.text = @"VIEWS";
    _purchasesLabel.text = @"PURCHASES";
    
    _productImageView.image = _productImage;
    _productImageView.contentMode = UIViewContentModeScaleAspectFill;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
