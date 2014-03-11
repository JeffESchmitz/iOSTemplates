//
//  SidebarCell2.h
//  ADVFlatUI
//
//  Created by Tope on 05/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SidebarCell2 : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel* titleLabel;

@property (nonatomic, weak) IBOutlet UILabel* countLabel;

@property (nonatomic, weak) IBOutlet UIView* bgView;

@property (nonatomic, weak) IBOutlet UIView* topSeparator;

@property (nonatomic, weak) IBOutlet UIView* bottomSeparator;

@property (nonatomic, weak) IBOutlet UIImageView* iconImageView;

@property (nonatomic, strong) UIColor* mainColor;

@property (nonatomic, strong) UIColor* darkColor;

@end
