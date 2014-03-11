//
//  SettingsController2.h
//  ADVFlatUI
//
//  Created by Tope on 05/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsController2 : UIViewController  <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView* tableView;

@end
