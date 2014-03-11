//
//  FeedController2.m
//  ADVFlatUI
//
//  Created by Tope on 03/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "FeedController2.h"
#import "FeedCell2.h"

@interface FeedController2 ()

@property (nonatomic, strong) NSArray* profileImages;

@end

@implementation FeedController2

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
	
    NSString* boldFontName = @"GillSans-Bold";
    
    [self styleNavigationBarWithFontName:boldFontName];
    
    self.title = @"Feed";
    
    self.feedTableView.dataSource = self;
    self.feedTableView.delegate = self;
    
    self.feedTableView.backgroundColor = [UIColor whiteColor];
    self.feedTableView.separatorColor = [UIColor colorWithWhite:0.9 alpha:0.6];
    
    self.profileImages = [NSArray arrayWithObjects:@"profile.jpg", @"profile-1.jpg", @"profile-2.jpg", @"profile-3.jpg", nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if(indexPath.row % 2){
        
        FeedCell2* cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell2"];
        
        cell.nameLabel.text = @"Laura Leamington";
        cell.updateLabel.text = @"This is a pic I took while on holiday on Wales. The weather played along nicely which doesn't happen often";
        
        cell.dateLabel.text = @"1 hr ago";
        cell.likeCountLabel.text = @"293 likes";
        cell.commentCountLabel.text = @"55 comments";
        
        NSString* profileImageName = self.profileImages[indexPath.row%self.profileImages.count];
        cell.profileImageView.image = [UIImage imageNamed:profileImageName];
        
        return cell;
    }
    else{
        
        FeedCell2* cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell2-Pic"];
        
        cell.nameLabel.text = @"John Keynetown";
        cell.updateLabel.text = @"On the trip to San Fransisco, the Golden gate bridge looked really magnificent. This is a city I would love to visit very often.";
        
        cell.dateLabel.text = @"1 hr ago";
        cell.likeCountLabel.text = @"134 likes";
        cell.commentCountLabel.text = @"21 comments";
        
        NSString* profileImageName = self.profileImages[indexPath.row%self.profileImages.count];
        cell.profileImageView.image = [UIImage imageNamed:profileImageName];
        
        cell.picImageView.image = [UIImage imageNamed:@"feed-bridge.jpg"];
        
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return (indexPath.row % 2) ? 125 : 251;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)styleNavigationBarWithFontName:(NSString*)navigationTitleFont{
    
    
    CGSize size = CGSizeMake(320, 44);
    UIColor* color = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:1.0f];
    
    UIGraphicsBeginImageContext(size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGRect fillRect = CGRectMake(0,0,size.width,size.height);
    CGContextSetFillColorWithColor(currentContext, color.CGColor);
    CGContextFillRect(currentContext, fillRect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    UINavigationBar* navAppearance = [UINavigationBar appearance];
    
    [navAppearance setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    [navAppearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIColor whiteColor], UITextAttributeTextColor,
                                           [UIFont fontWithName:navigationTitleFont size:18.0f], UITextAttributeFont, [NSValue valueWithCGSize:CGSizeMake(0.0, 0.0)], UITextAttributeTextShadowOffset,
                                           nil]];
    UIImageView* searchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search.png"]];
    searchView.frame = CGRectMake(0, 0, 20, 20);
    
    UIBarButtonItem* searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchView];
    
    self.navigationItem.rightBarButtonItem = searchItem;
    
    
    UIImageView* menuView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu.png"]];
    menuView.frame = CGRectMake(0, 0, 28, 20);
    
    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuView];
    
    self.navigationItem.leftBarButtonItem = menuItem;
}


@end
