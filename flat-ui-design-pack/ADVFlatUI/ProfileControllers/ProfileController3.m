//
//  ProfileController3.m
//  ADVFlatUI
//
//  Created by Tope on 31/05/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "ProfileController3.h"
#import <QuartzCore/QuartzCore.h>

@interface ProfileController3 ()

@end

@implementation ProfileController3

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
	
    UIColor* mainColor = [UIColor colorWithRed:28.0/255 green:158.0/255 blue:121.0/255 alpha:1.0f];
    UIColor* imageBorderColor = [UIColor colorWithRed:28.0/255 green:158.0/255 blue:121.0/255 alpha:0.4f];
    
    NSString* fontName = @"Avenir-Book";
    NSString* boldItalicFontName = @"Avenir-BlackOblique";
    NSString* boldFontName = @"Avenir-Black";
    
    
    self.nameLabel.textColor =  mainColor;
    self.nameLabel.font =  [UIFont fontWithName:boldItalicFontName size:18.0f];
    self.nameLabel.text = @"Maria Llewellyngot";
    
    self.usernameLabel.textColor =  mainColor;
    self.usernameLabel.font =  [UIFont fontWithName:fontName size:14.0f];
    self.usernameLabel.text = @"@llewellyngot";
    
    UIFont* countLabelFont = [UIFont fontWithName:boldItalicFontName size:20.0f];
    UIColor* countColor = mainColor;
    
    self.followerCountLabel.textColor =  countColor;
    self.followerCountLabel.font =  countLabelFont;
    self.followerCountLabel.text = @"132k";
    
    self.followingCountLabel.textColor =  countColor;
    self.followingCountLabel.font =  countLabelFont;
    self.followingCountLabel.text = @"200";
    
    self.updateCountLabel.textColor =  countColor;
    self.updateCountLabel.font =  countLabelFont;
    self.updateCountLabel.text = @"20k";
    
    UIFont* socialFont = [UIFont fontWithName:boldItalicFontName size:10.0f];
    
    self.followerLabel.textColor =  mainColor;
    self.followerLabel.font =  socialFont;
    self.followerLabel.text = @"FOLLOWERS";
    
    self.followingLabel.textColor =  mainColor;
    self.followingLabel.font =  socialFont;
    self.followingLabel.text = @"FOLLOWING";
    
    self.updateLabel.textColor =  mainColor;
    self.updateLabel.font =  socialFont;
    self.updateLabel.text = @"UPDATES";
    
    
    self.bioLabel.textColor =  mainColor;
    self.bioLabel.font =  [UIFont fontWithName:fontName size:14.0f];
    self.bioLabel.text = @"Founder, CEO of Mavin Records, Entrepreneur mom and action gal";
    
    self.friendLabel.textColor =  mainColor;
    self.friendLabel.font =  [UIFont fontWithName:boldFontName size:18.0f];;
    self.friendLabel.text = @"Friends";
    
    self.profileImageView.image = [UIImage imageNamed:@"profile.jpg"];
    self.profileImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.borderWidth = 4.0f;
    self.profileImageView.layer.cornerRadius = 55.0f;
    self.profileImageView.layer.borderColor = imageBorderColor.CGColor;
    
    self.bioContainer.layer.borderColor = [UIColor whiteColor].CGColor;
    self.bioContainer.layer.borderWidth = 4.0f;
    self.bioContainer.layer.cornerRadius = 5.0f;
    
    self.friendContainer.layer.borderColor = [UIColor whiteColor].CGColor;
    self.friendContainer.layer.borderWidth = 4.0f;
    self.friendContainer.clipsToBounds = YES;
    self.friendContainer.layer.cornerRadius = 5.0f;
    
    [self styleFriendProfileImage:self.friendImageView1 withImageNamed:@"profile-1.jpg" andColor:imageBorderColor];
    [self styleFriendProfileImage:self.friendImageView2 withImageNamed:@"profile-2.jpg" andColor:imageBorderColor];
    [self styleFriendProfileImage:self.friendImageView3 withImageNamed:@"profile-3.jpg" andColor:imageBorderColor];
    
    [self addDividerToView:self.scrollView atLocation:230];
    [self addDividerToView:self.scrollView atLocation:300];
    [self addDividerToView:self.scrollView atLocation:370];
    
    self.scrollView.contentSize = CGSizeMake(320, 590);
    self.scrollView.backgroundColor = [UIColor whiteColor];
}

-(void)styleFriendProfileImage:(UIImageView*)imageView withImageNamed:(NSString*)imageName andColor:(UIColor*)color{
    
    imageView.image = [UIImage imageNamed:imageName];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.layer.borderWidth = 4.0f;
    imageView.layer.borderColor = color.CGColor;
    imageView.layer.cornerRadius = 35.0f;
}

-(void)addDividerToView:(UIView*)view atLocation:(CGFloat)location{
    
    UIView* divider = [[UIView alloc] initWithFrame:CGRectMake(20, location, 280, 1)];
    divider.backgroundColor = [UIColor colorWithWhite:0.9f alpha:0.7f];
    [view addSubview:divider];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
