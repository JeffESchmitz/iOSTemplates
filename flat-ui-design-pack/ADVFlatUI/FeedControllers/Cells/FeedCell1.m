//
//  FeedCell1.m
//  ADVFlatUI
//
//  Created by Tope on 03/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "FeedCell1.h"
#import <QuartzCore/QuartzCore.h>

@implementation FeedCell1

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
    
    UIColor* mainColor = [UIColor colorWithRed:222.0/255 green:59.0/255 blue:47.0/255 alpha:1.0f];
    UIColor* neutralColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    
    NSString* fontName = @"GillSans-Italic";
    NSString* boldFontName = @"GillSans-Bold";
    
    self.nameLabel.textColor =  mainColor;
    self.nameLabel.font =  [UIFont fontWithName:boldFontName size:14.0f];
    
    self.updateLabel.textColor =  neutralColor;
    self.updateLabel.font =  [UIFont fontWithName:fontName size:12.0f];
    
    self.dateLabel.textColor = neutralColor;
    self.dateLabel.font =  [UIFont fontWithName:boldFontName size:14.0f];
    
    self.commentCountLabel.textColor = neutralColor;
    self.commentCountLabel.font =  [UIFont fontWithName:fontName size:12.0f];
    
    self.likeCountLabel.textColor = neutralColor;
    self.likeCountLabel.font =  [UIFont fontWithName:fontName size:12.0f];
    
    self.feedContainer.layer.cornerRadius = 3.0f;
    self.feedContainer.clipsToBounds = YES;
    
    self.picImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.picImageView.clipsToBounds = YES;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
