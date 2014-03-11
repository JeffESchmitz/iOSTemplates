//
//  ProfileController2.h
//  ADVFlatUI
//
//  Created by Tope on 31/05/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileController2 : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView* profileBgImageView;

@property (nonatomic, weak) IBOutlet UIImageView* profileImageView;

@property (nonatomic, weak) IBOutlet UIView* overlayView;

@property (nonatomic, weak) IBOutlet UIImageView* friendImageView1;

@property (nonatomic, weak) IBOutlet UIImageView* friendImageView2;

@property (nonatomic, weak) IBOutlet UIImageView* friendImageView3;

@property (nonatomic, weak) IBOutlet UILabel* nameLabel;

@property (nonatomic, weak) IBOutlet UILabel* usernameLabel;

@property (nonatomic, weak) IBOutlet UILabel* followerLabel;

@property (nonatomic, weak) IBOutlet UILabel* followingLabel;

@property (nonatomic, weak) IBOutlet UILabel* updateLabel;

@property (nonatomic, weak) IBOutlet UILabel* followerCountLabel;

@property (nonatomic, weak) IBOutlet UILabel* followingCountLabel;

@property (nonatomic, weak) IBOutlet UILabel* updateCountLabel;

@property (nonatomic, weak) IBOutlet UILabel* bioLabel;

@property (nonatomic, weak) IBOutlet UILabel* friendLabel;

@property (nonatomic, weak) IBOutlet UIView* bioContainer;

@property (nonatomic, weak) IBOutlet UIView* friendContainer;

@property (nonatomic, weak) IBOutlet UIView* countContainer;

@property (nonatomic, weak) IBOutlet UIScrollView* scrollView;

@end
