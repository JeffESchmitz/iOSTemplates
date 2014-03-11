//
//  ViewController.m
//  ADVFlatUI
//
//  Created by Tope on 30/05/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "LoginController1.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginController1 ()

@end

@implementation LoginController1

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor* mainColor = [UIColor colorWithRed:222.0/255 green:59.0/255 blue:47.0/255 alpha:1.0f];
    
    NSString* fontName = @"Avenir-Book";
    NSString* boldFontName = @"Avenir-Black";
    
    self.view.backgroundColor = [UIColor colorWithRed:239.0/255 green:239.0/255 blue:239.0/255 alpha:1.0f];

    self.elementContainer.backgroundColor = [UIColor whiteColor];
    self.elementContainer.layer.cornerRadius = 3.0f;
    
    self.iconImageContainer.backgroundColor = mainColor;
    self.iconImageContainer.layer.cornerRadius = 3.0f;
    
    self.iconImageView.image = [UIImage imageNamed:@"check"];
    
    self.usernameField.backgroundColor = [UIColor colorWithRed:237.0/255 green:243.0/255 blue:245.0/255 alpha:1.0f];
    self.usernameField.layer.cornerRadius = 3.0f;
    self.usernameField.placeholder = @"Username";
    self.usernameField.leftViewMode = UITextFieldViewModeAlways;
    UIView* leftView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.usernameField.leftView = leftView1;
    self.usernameField.font = [UIFont fontWithName:fontName size:16.0f];
    
    self.passwordField.backgroundColor = [UIColor colorWithRed:237.0/255 green:243.0/255 blue:245.0/255 alpha:1.0f];
    self.passwordField.layer.cornerRadius = 3.0f;
    self.passwordField.placeholder = @"Password";
    self.passwordField.leftViewMode = UITextFieldViewModeAlways;
    UIView* leftView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.passwordField.leftView = leftView2;
    self.passwordField.font = [UIFont fontWithName:fontName size:16.0f];
    
    self.loginButton.backgroundColor = mainColor;
    self.loginButton.layer.cornerRadius = 3.0f;
    self.loginButton.titleLabel.font = [UIFont fontWithName:boldFontName size:20.0f];
    [self.loginButton setTitle:@"LOGIN" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    
    self.forgotButton.backgroundColor = [UIColor clearColor];
    self.forgotButton.titleLabel.font = [UIFont fontWithName:fontName size:12.0f];
    [self.forgotButton setTitle:@"Forgot Password?" forState:UIControlStateNormal];
    [self.forgotButton setTitleColor:mainColor forState:UIControlStateNormal];
    [self.forgotButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
