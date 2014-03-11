//
//  LoginController4.h
//  ADVFlatUI
//
//  Created by Tope on 30/05/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseLoginController.h"

@interface LoginController4 : BaseLoginController

@property (nonatomic, weak) IBOutlet UITextField * usernameField;

@property (nonatomic, weak) IBOutlet UITextField * passwordField;

@property (nonatomic, weak) IBOutlet UIButton *loginButton;

@property (nonatomic, weak) IBOutlet UIButton * forgotButton;

@property (nonatomic, weak) IBOutlet UILabel * titleLabel;

@property (nonatomic, weak) IBOutlet UIImageView * headerImageView;

@property (nonatomic, weak) IBOutlet UIView * infoView;

@property (nonatomic, weak) IBOutlet UILabel * infoLabel;

@property (nonatomic, weak) IBOutlet UIView * overlayView;


@end
