//
//  CollectionsCell.m
//  StoreMob
//
//  Created by App Design Vault on 26/11/13.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "CollectionsCell.h"

@implementation CollectionsCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)awakeFromNib{
    _activityIndicator.hidesWhenStopped = YES;
    
    [_imgSample setContentMode:UIViewContentModeScaleAspectFill];
    [_imgViews setContentMode:UIViewContentModeScaleAspectFill];
    [_imgLikes setContentMode:UIViewContentModeScaleAspectFill];
    [_imgPurchases setContentMode:UIViewContentModeScaleAspectFill];
    
   /* [_lblBrand setFont:[UIFont boldSystemFontOfSize:13]];

    UIFont* smallFont = [UIFont systemFontOfSize:12];
    [_lblLikes setFont:smallFont];
    [_lblPurchases setFont:smallFont];
    [_lblViews setFont:smallFont];
    
    [_lblLikes setTextColor:[UIColor colorWithRed:1.0 green:91.0/255.0 blue:84.0/255.0 alpha:1.0]];
    [_lblViews setTextColor:[UIColor colorWithRed:1.0 green:91.0/255.0 blue:84.0/255.0 alpha:1.0]];
    [_lblPurchases setTextColor:[UIColor colorWithRed:1.0 green:91.0/255.0 blue:84.0/255.0 alpha:1.0]];
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    */
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
