//
//  MainCollectionCell.m
//  ADVFlatUI
//
//  Created by Tope on 06/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "MainCollectionCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation MainCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib{
    
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:15.0f];
    
    UIColor* mainColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    
    self.bgView.backgroundColor = mainColor;
    self.bgView.layer.cornerRadius = 3.0f;

}

@end
