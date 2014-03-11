//
//  FeedController3.m
//  ADVFlatUI
//
//  Created by Tope on 03/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "FeedController3.h"
#import "FeedCell3.h"

@interface FeedController3 ()

@property (nonatomic, strong) NSArray* profileImages;

@end

@implementation FeedController3

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
	
    NSString* boldFontName = @"Avenir-Black";
    
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
    
    FeedCell3* cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell3"];
    
    cell.nameLabel.text = @"Laura Leamington";
    cell.updateLabel.text = @"This is a pic I took while on holiday on Wales. The weather played along nicely which doesn't happen often";
    
    cell.dateLabel.text = @"1 hr ago";
    cell.likeCountLabel.text = @"293 likes";
    cell.commentCountLabel.text = @"55 comments";
    
    NSString* profileImageName = self.profileImages[indexPath.row%self.profileImages.count];
    cell.profileImageView.image = [UIImage imageNamed:profileImageName];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)styleNavigationBarWithFontName:(NSString*)navigationTitleFont{
    
    
    CGSize size = CGSizeMake(320, 44);
    UIColor* color = [UIColor whiteColor];
    
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
                                           [UIColor colorWithRed:28.0/255 green:158.0/255 blue:121.0/255 alpha:1.0f], UITextAttributeTextColor,
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
