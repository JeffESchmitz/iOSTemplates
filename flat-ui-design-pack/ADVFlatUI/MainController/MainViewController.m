//
//  MainViewController.m
//  ADVFlatUI
//
//  Created by Tope on 03/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "MainViewController.h"
#import "MainSideViewController.h"
#import "ControllerInfo.h"
#import "StoryboardInfo.h"
#import "MBProgressHUD.h"
#import <QuartzCore/QuartzCore.h>


@interface MainViewController ()

@property (nonatomic, strong) NSArray* storyboards;

@property (nonatomic, strong) UISwipeGestureRecognizer *swipeGesture;

@end

@implementation MainViewController

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
	
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.layout.minimumInteritemSpacing = 10;
    self.layout.minimumLineSpacing = 10;
    self.layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);

    UIColor* darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
    self.collectionView.backgroundColor = darkColor;

    ControllerInfo* login1 = [[ControllerInfo alloc] initWithName:@"Login Design 1" andControllerId:@"LoginController1"];
    ControllerInfo* login2 = [[ControllerInfo alloc] initWithName:@"Login Design 2" andControllerId:@"LoginController2"];
    ControllerInfo* login3 = [[ControllerInfo alloc] initWithName:@"Login Design 3" andControllerId:@"LoginController3"];
    ControllerInfo* login4 = [[ControllerInfo alloc] initWithName:@"Login Design 4" andControllerId:@"LoginController4"];
    
    StoryboardInfo* loginStoryboard = [[StoryboardInfo alloc] initWithName:@"Logins" andStoryboardId:@"LoginStoryboard"];
    loginStoryboard.controllers = @[login1, login2, login3, login4];
    
    ControllerInfo* profile1 = [[ControllerInfo alloc] initWithName:@"Profile Design 1" andControllerId:@"ProfileController1"];
    ControllerInfo* profile2 = [[ControllerInfo alloc] initWithName:@"Profile Design 2" andControllerId:@"ProfileController2"];
    ControllerInfo* profile3 = [[ControllerInfo alloc] initWithName:@"Profile Design 3" andControllerId:@"ProfileController3"];
    
    StoryboardInfo* profileStoryboard = [[StoryboardInfo alloc] initWithName:@"User Profiles" andStoryboardId:@"ProfileStoryboard"];
    profileStoryboard.controllers = @[profile1, profile2, profile3];
    
    ControllerInfo* feed1 = [[ControllerInfo alloc] initWithName:@"Activity Feeds 1" andControllerId:@"FeedController1"];
    ControllerInfo* feed2 = [[ControllerInfo alloc] initWithName:@"Activity Feeds 2" andControllerId:@"FeedController2"];
    ControllerInfo* feed3 = [[ControllerInfo alloc] initWithName:@"Activity Feeds 3" andControllerId:@"FeedController3"];
    ControllerInfo* feed4 = [[ControllerInfo alloc] initWithName:@"Activity Feeds 4" andControllerId:@"FeedController4"];
    
    StoryboardInfo* feedStoryboard = [[StoryboardInfo alloc] initWithName:@"Activity Feeds" andStoryboardId:@"FeedStoryboard"];
    feedStoryboard.controllers = @[feed1, feed2, feed3, feed4];
    
    ControllerInfo* settings1 = [[ControllerInfo alloc] initWithName:@"Settings Design 1" andControllerId:@"SettingsController1"];
    ControllerInfo* settings2 = [[ControllerInfo alloc] initWithName:@"Settings Design 2" andControllerId:@"SettingsController2"];
    
    StoryboardInfo* settingsStoryboard = [[StoryboardInfo alloc] initWithName:@"Settings" andStoryboardId:@"SettingsStoryboard"];
    settingsStoryboard.controllers = @[settings1, settings2];
    
    ControllerInfo* sidebar1 = [[ControllerInfo alloc] initWithName:@"Sidebar Design 1" andControllerId:@"SidebarController1"];
    ControllerInfo* sidebar2 = [[ControllerInfo alloc] initWithName:@"Sideber Design 2" andControllerId:@"SidebarController2"];
    
    StoryboardInfo* sidebarStoryboard = [[StoryboardInfo alloc] initWithName:@"Sidebars" andStoryboardId:@"SidebarStoryboard"];
    sidebarStoryboard.controllers = @[sidebar1, sidebar2];

    
    self.storyboards = @[loginStoryboard, profileStoryboard, feedStoryboard ,settingsStoryboard, sidebarStoryboard];
    
    
    self.swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedScreen:)];
    self.swipeGesture.numberOfTouchesRequired = 1;
    self.swipeGesture.direction = (UISwipeGestureRecognizerDirectionRight);
}

- (void)swipedScreen:(UISwipeGestureRecognizer*)gesture {
    
    UIView* view = gesture.view;
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.75;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype =kCATransitionFromLeft;
    transition.delegate = self;
    [self.view.layer addAnimation:transition forKey:nil];
    [view removeFromSuperview];
    [view removeGestureRecognizer:self.swipeGesture];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    StoryboardInfo* storyboardInfo = self.storyboards[section];
    return storyboardInfo.controllers.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.storyboards.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    StoryboardInfo* storyboardInfo = self.storyboards[indexPath.section];
    
    ControllerInfo* controllerInfo = storyboardInfo.controllers[indexPath.row];
    
    UILabel* label = (UILabel*)[cell viewWithTag:1];
    label.text = controllerInfo.name;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        
        UILabel* label = (UILabel*)[headerView viewWithTag:1];
        
        StoryboardInfo* storyboardInfo = self.storyboards[indexPath.section];
        label.text = [storyboardInfo.name uppercaseString];
        label.font = [UIFont fontWithName:@"Avenir-Black" size:18.0f];
        label.textColor = [UIColor whiteColor];
        
        reusableview = headerView;
    }
    
    
    return reusableview;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    StoryboardInfo* storyboardInfo = self.storyboards[indexPath.section];
    
    ControllerInfo* controllerInfo = storyboardInfo.controllers[indexPath.row];
    
    self.currentViewController = [self getControllerFromStoryboardInfo:storyboardInfo andControllerInfo:controllerInfo];
    
    UIViewController* controller = self.currentViewController;
    controller.view.frame = CGRectMake(0, 0, controller.view.frame.size.width, controller.view.frame.size.height);
    
    
    [controller.view addGestureRecognizer:self.swipeGesture];
    
    CGFloat yOffset = [controller isKindOfClass:[UINavigationController class]] ? -20 : 0;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:controller.view animated:YES];

    hud.labelText = @"Swipe right to dismiss";
    
    controller.view.frame = CGRectMake(320, yOffset, controller.view.frame.size.width, controller.view.frame.size.height);
    [self.view addSubview:controller.view];
    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         controller.view.frame = CGRectMake(0, yOffset, controller.view.frame.size.width, controller.view.frame.size.height);
                        
                     }
                     completion:^(BOOL finished){
                         
                         [MBProgressHUD hideHUDForView:controller.view animated:YES];
                         
                     }];
}

-(UIViewController*)getControllerFromStoryboardInfo:(StoryboardInfo*)storyboardInfo andControllerInfo:(ControllerInfo*)controllerInfo {
    
    if([storyboardInfo.name rangeOfString:@"Sidebar"].location == NSNotFound){
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardInfo.storyboardId bundle:nil];
        return [storyboard instantiateViewControllerWithIdentifier:controllerInfo.controllerId];
    }
    else{
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardInfo.storyboardId bundle:nil];
        MainSideViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"MainSideViewController"];
        controller.controllerId = controllerInfo.controllerId;
        
        return controller;
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
