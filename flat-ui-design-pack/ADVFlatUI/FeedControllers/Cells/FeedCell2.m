//
//  FeedCell2.m
//  ADVFlatUI
//
//  Created by Tope on 03/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "FeedCell2.h"
#import <QuartzCore/QuartzCore.h>

@implementation FeedCell2

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
    
    UIColor* mainColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:1.0f];
    UIColor* neutralColor = [UIColor colorWithWhite:0.4 alpha:1.0];
    
    UIColor* mainColorLight = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:0.7f];
    UIColor* lightColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    
    NSString* fontName = @"Optima-Regular";
    NSString* boldFontName = @"Optima-ExtraBlack";
    
    self.nameLabel.textColor =  mainColor;
    self.nameLabel.font =  [UIFont fontWithName:boldFontName size:14.0f];
    
    self.updateLabel.textColor =  neutralColor;
    self.updateLabel.font =  [UIFont fontWithName:fontName size:12.0f];
    
    self.dateLabel.textColor = lightColor;
    self.dateLabel.font =  [UIFont fontWithName:fontName size:8.0f];
    
    self.commentCountLabel.textColor = mainColorLight;
    self.commentCountLabel.font =  [UIFont fontWithName:fontName size:10.0f];
    
    self.likeCountLabel.textColor = mainColorLight;
    self.likeCountLabel.font =  [UIFont fontWithName:fontName size:10.0f];
    
    self.picImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.picImageView.clipsToBounds = YES;
    self.picImageView.layer.cornerRadius = 2.0f;
    
    self.picImageContainer.backgroundColor = [UIColor whiteColor];
    self.picImageContainer.layer.borderColor = [UIColor colorWithWhite:0.8f alpha:0.6f].CGColor;
    self.picImageContainer.layer.borderWidth = 1.0f;
    self.picImageContainer.layer.cornerRadius = 2.0f;

    
    self.profileImageView.layer.cornerRadius = 10.0f;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
