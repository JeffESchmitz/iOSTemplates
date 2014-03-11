//
//  CollectionDetailController.h
//  StoreMob
//
//  Created by Tope Abayomi on 06/12/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionDetailController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView* productImageView;

@property (nonatomic, weak) IBOutlet UILabel* titleLabel;

@property (nonatomic, weak) IBOutlet UILabel* likesLabel;
@property (nonatomic, weak) IBOutlet UILabel* likesCountLabel;

@property (nonatomic, weak) IBOutlet UILabel* purchasesLabel;
@property (nonatomic, weak) IBOutlet UILabel* purchasesCountLabel;

@property (nonatomic, weak) IBOutlet UILabel* viewsLabel;
@property (nonatomic, weak) IBOutlet UILabel* viewsCountLabel;

@property (nonatomic, strong) IBOutlet UIView* overlayView;

@property (nonatomic, strong) NSDictionary* data;
@property (nonatomic, strong) UIImage* productImage;

@end
