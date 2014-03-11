//
//  ProfileController2.m
//  ADVFlatUI
//
//  Created by Tope on 31/05/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "ProfileController2.h"
#import <QuartzCore/QuartzCore.h>

@interface ProfileController2 ()

@end

@implementation ProfileController2

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
	
    UIColor* mainColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:1.0f];
    
    NSString* fontName = @"Optima-Italic";
    NSString* boldFontName = @"Optima-ExtraBlack";
    
    self.nameLabel.textColor =  [UIColor whiteColor];
    self.nameLabel.font =  [UIFont fontWithName:boldFontName size:18.0f];
    self.nameLabel.text = @"Maria Llewellyngot";
    
    self.usernameLabel.textColor =  [UIColor whiteColor];
    self.usernameLabel.font =  [UIFont fontWithName:fontName size:14.0f];
    self.usernameLabel.text = @"@llewellyngot";
    
    UIFont* countLabelFont = [UIFont fontWithName:boldFontName size:20.0f];
    self.followerCountLabel.textColor =  mainColor;
    self.followerCountLabel.font =  countLabelFont;
    self.followerCountLabel.text = @"132k";
    
    self.followingCountLabel.textColor =  mainColor;
    self.followingCountLabel.font =  countLabelFont;
    self.followingCountLabel.text = @"200";
    
    self.updateCountLabel.textColor =  mainColor;
    self.updateCountLabel.font =  countLabelFont;
    self.updateCountLabel.text = @"20k";
    
    
    UIFont* socialFont = [UIFont fontWithName:boldFontName size:10.0f];
    UIColor* socialColor = [UIColor lightGrayColor];
    
    self.followerLabel.textColor =  socialColor;
    self.followerLabel.font =  socialFont;
    self.followerLabel.text = @"FOLLOWERS";
    
    self.followingLabel.textColor =  socialColor;
    self.followingLabel.font =  socialFont;
    self.followingLabel.text = @"FOLLOWING";
    
    self.updateLabel.textColor =  socialColor;
    self.updateLabel.font =  socialFont;
    self.updateLabel.text = @"UPDATES";
    
  
    self.bioLabel.textColor =  mainColor;
    self.bioLabel.font =  [UIFont fontWithName:fontName size:14.0f];
    self.bioLabel.text = @"Founder, CEO of Mavin Records, Entrepreneur mom and action gal";
    
    self.friendLabel.textColor =  mainColor;
    self.friendLabel.font =  [UIFont fontWithName:boldFontName size:20.0f];;
    self.friendLabel.text = @"Friends";
    
    self.profileBgImageView.image = [UIImage imageNamed:@"bridge.jpg"];
    self.profileBgImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.profileImageView.image = [UIImage imageNamed:@"profile.jpg"];
    self.profileImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.cornerRadius = 48.0f;
    self.profileImageView.layer.borderWidth = 4.0f;
    self.profileImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.overlayView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5f];
    
    self.countContainer.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0f];
    
    self.bioContainer.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.bioContainer.layer.borderWidth = 1.0f;
    
    self.friendContainer.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.friendContainer.layer.borderWidth = 1.0f;
    
    UIColor* imageBorderColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:0.4f];
    
    [self styleFriendProfileImage:self.friendImageView1 withImageNamed:@"profile-1.jpg" andColor:imageBorderColor];
    [self styleFriendProfileImage:self.friendImageView2 withImageNamed:@"profile-2.jpg" andColor:imageBorderColor];
    [self styleFriendProfileImage:self.friendImageView3 withImageNamed:@"profile-3.jpg" andColor:imageBorderColor];
    
    self.scrollView.contentSize = CGSizeMake(320, 590);
}

-(void)styleFriendProfileImage:(UIImageView*)imageView withImageNamed:(NSString*)imageName andColor:(UIColor*)color{
    
    imageView.image = [UIImage imageNamed:imageName];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    //imageView.layer.cornerRadius = 30.0f;
    imageView.layer.borderWidth = 4.0f;
    imageView.layer.borderColor = color.CGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
