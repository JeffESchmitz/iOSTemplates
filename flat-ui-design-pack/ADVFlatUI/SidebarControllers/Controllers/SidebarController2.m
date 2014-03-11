//
//  SidebarController2.m
//  ADVFlatUI
//
//  Created by Tope on 05/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "SidebarController2.h"
#import "SidebarCell2.h"
#import <QuartzCore/QuartzCore.h>

@interface SidebarController2 ()

@property (nonatomic, strong) NSArray* items;

@end

@implementation SidebarController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UIColor* mainColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    UIColor* darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
    
    self.view.backgroundColor = darkColor;
    self.tableView.backgroundColor = darkColor;
    self.tableView.separatorColor = [UIColor clearColor];
    
    NSString* fontName = @"Avenir-Black";
    NSString* boldFontName = @"Avenir-BlackOblique";
    
    self.profileNameLabel.textColor = [UIColor whiteColor];
    self.profileNameLabel.font = [UIFont fontWithName:fontName size:14.0f];
    self.profileNameLabel.text = @"Lena Llellywyngot";
    
    self.profileLocationLabel.textColor = mainColor;
    self.profileLocationLabel.font = [UIFont fontWithName:boldFontName size:12.0f];
    self.profileLocationLabel.text = @"London, UK";
    
    self.profileImageView.image = [UIImage imageNamed:@"profile.jpg"];
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.borderWidth = 4.0f;
    self.profileImageView.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.5f].CGColor;
    self.profileImageView.layer.cornerRadius = 35.0f;
    
    
    NSDictionary* object1 = [NSDictionary dictionaryWithObjects:@[ @"Inbox", @"7", @"envelope" ] forKeys:@[ @"title", @"count", @"icon" ]];
    NSDictionary* object2 = [NSDictionary dictionaryWithObjects:@[ @"Updates", @"7", @"check" ] forKeys:@[ @"title", @"count", @"icon" ]];
    NSDictionary* object3 = [NSDictionary dictionaryWithObjects:@[ @"Account", @"0", @"account" ] forKeys:@[ @"title", @"count", @"icon" ]];
    NSDictionary* object4 = [NSDictionary dictionaryWithObjects:@[ @"Settings", @"0", @"settings" ] forKeys:@[ @"title", @"count", @"icon" ]];
    NSDictionary* object5 = [NSDictionary dictionaryWithObjects:@[ @"Logout", @"0", @"arrow" ] forKeys:@[ @"title", @"count", @"icon" ]];
    
    self.items = @[object1, object2, object3, object4, object5];
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SidebarCell2* cell = [tableView dequeueReusableCellWithIdentifier:@"SidebarCell2"];
    
    NSDictionary* item = self.items[indexPath.row];
    
    cell.titleLabel.text = item[@"title"];
    cell.iconImageView.image = [UIImage imageNamed:item[@"icon"]];
    
    NSString* count = item[@"count"];
    if(![count isEqualToString:@"0"]){
        cell.countLabel.text = count;
    }
    else{
        cell.countLabel.alpha = 0;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
