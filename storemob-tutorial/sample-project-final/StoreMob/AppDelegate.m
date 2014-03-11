//
//  AppDelegate.m
//  StoreMob
//
//  Created by App Design Vault on 19/11/13.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Set the tab bar's backround color.
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:1.0 green:91.0/255.0 blue:84.0/255.0 alpha:1.0]];
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:1.0 green:91.0/255.0 blue:84.0/255.0 alpha:1.0]];

    
    
    // Get a pointer to the tab bar controller for being able to set all the following properties.
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    
    NSInteger index = 1;
    
    for (UIViewController* controller in tabBarController.viewControllers) {
        
        // Set the image of the tab bar items.
        NSString* tabImageName = [NSString stringWithFormat:@"tab%d", index++];
         [controller.tabBarItem setImage:[[UIImage imageNamed:tabImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        // Apply the following insets so all tab images look vertically centered.
        UIEdgeInsets insets = UIEdgeInsetsMake(5.0, 0.0, -5.0, 0.0);
        [controller.tabBarItem setImageInsets:insets];
        
    }
    
    // Set the selection indicator image.
    [[tabBarController tabBar] setSelectionIndicatorImage:[[UIImage imageNamed:@"tab_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
