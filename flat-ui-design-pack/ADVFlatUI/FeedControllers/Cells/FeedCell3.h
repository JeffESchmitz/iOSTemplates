//
//  FeedCell3.h
//  ADVFlatUI
//
//  Created by Tope on 03/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedCell3 : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView* profileImageView;

@property (nonatomic, weak) IBOutlet UIImageView* picImageView;

@property (nonatomic, weak) IBOutlet UIView* picImageContainer;

@property (nonatomic, weak) IBOutlet UILabel* nameLabel;

@property (nonatomic, weak) IBOutlet UILabel* updateLabel;

@property (nonatomic, weak) IBOutlet UILabel* dateLabel;

@property (nonatomic, weak) IBOutlet UILabel* commentCountLabel;

@property (nonatomic, weak) IBOutlet UILabel* likeCountLabel;

@end
