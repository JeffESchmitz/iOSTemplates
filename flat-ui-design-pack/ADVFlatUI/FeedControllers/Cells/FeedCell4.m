//
//  FeedCell4.m
//  ADVFlatUI
//
//  Created by Tope on 03/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "FeedCell4.h"
#import <QuartzCore/QuartzCore.h>

@implementation FeedCell4

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)awakeFromNib{
    
    
    self.feedContainer.backgroundColor = [UIColor whiteColor];
    
    
    UIColor* mainColor = [UIColor colorWithRed:100.0/255 green:35.0/255 blue:87.0/255 alpha:1.0f];
    UIColor* countColor = [UIColor colorWithRed:116.0/255 green:99.0/255 blue:113.0/255 alpha:1.0f];
    UIColor* neutralColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    NSString* fontName = @"Avenir-Book";
    NSString* boldFontName = @"Avenir-Black";
    
    self.nameLabel.textColor =  mainColor;
    self.nameLabel.font =  [UIFont fontWithName:boldFontName size:14.0f];
    
    self.updateLabel.textColor =  neutralColor;
    self.updateLabel.font =  [UIFont fontWithName:fontName size:10.0f];
    
    self.dateLabel.textColor = neutralColor;
    self.dateLabel.font =  [UIFont fontWithName:fontName size:10.0f];
    
    self.commentCountLabel.textColor = countColor;
    self.commentCountLabel.font =  [UIFont fontWithName:boldFontName size:11.0f];
    
    self.likeCountLabel.textColor = countColor;
    self.likeCountLabel.font =  [UIFont fontWithName:boldFontName size:11.0f];
    
    self.feedContainer.layer.cornerRadius = 3.0f;
    self.feedContainer.clipsToBounds = YES;
    
    self.picImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.picImageView.clipsToBounds = YES;
    
    self.socialContainer.backgroundColor = [UIColor colorWithRed:220.0/255 green:214.0/255 blue:219.0/255 alpha:1.0f];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
