//
//  CollectionsViewController.h
//  StoreMob
//
//  Created by App Design Vault on 19/11/13.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionsViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *cvCollections;

@end
