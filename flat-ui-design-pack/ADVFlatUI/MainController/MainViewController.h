//
//  MainViewController.h
//  ADVFlatUI
//
//  Created by Tope on 03/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView* collectionView;

@property (nonatomic, weak) IBOutlet UICollectionViewFlowLayout* layout;

@property (nonatomic, strong) IBOutlet UIViewController* currentViewController;

@end
