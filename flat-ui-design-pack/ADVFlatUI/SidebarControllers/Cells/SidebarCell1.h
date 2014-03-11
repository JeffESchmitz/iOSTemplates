//
//  SidebarCell1.h
//  ADVFlatUI
//
//  Created by Tope on 05/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SidebarCell1 : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel* titleLabel;

@property (nonatomic, weak) IBOutlet UILabel* countLabel;

@property (nonatomic, weak) IBOutlet UIView* bgView;

@property (nonatomic, weak) IBOutlet UIView* topSeparator;

@property (nonatomic, weak) IBOutlet UIView* bottomSeparator;

@property (nonatomic, weak) IBOutlet UIImageView* iconImageView;

@end
