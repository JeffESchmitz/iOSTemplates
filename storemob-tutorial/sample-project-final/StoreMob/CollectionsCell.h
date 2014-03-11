//
//  CollectionsCell.h
//  StoreMob
//
//  Created by App Design Vault on 26/11/13.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionsCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgSample;
@property (weak, nonatomic) IBOutlet UILabel *lblBrand;
@property (weak, nonatomic) IBOutlet UIImageView *imgViews;
@property (weak, nonatomic) IBOutlet UILabel *lblViews;
@property (weak, nonatomic) IBOutlet UIImageView *imgLikes;
@property (weak, nonatomic) IBOutlet UILabel *lblLikes;
@property (weak, nonatomic) IBOutlet UIImageView *imgPurchases;
@property (weak, nonatomic) IBOutlet UILabel *lblPurchases;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
