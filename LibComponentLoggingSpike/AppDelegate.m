//
//  AppDelegate.m
//  LibComponentLoggingSpike
//
//  Created by John Dzak on 10/27/12.
//  Copyright (c) 2012 John Dzak. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

#import <LibComponentLogging-Core/lcl.h>
//#import "LCLLogFileConfig.h"

// undef logger defined in RestKit
#if defined(_lcl_logger)
#   undef  _lcl_logger
#endif

#import <LibComponentLogging-LogFile/LCLLogFile.h>
//#import <LibComponentLogging-qlog/qlog.h>
//#define lcl_cDefaultLogComponent
//#define ql_component lcl_cDefaultLogComponent


@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    lcl_configure_by_name("*", lcl_vTrace);

    lcl_log(lcl_cMain, lcl_vCritical, @"Test");
    qlcritical(@"Test qlog");
    
    printf("Log messages are written to %s. You can open Console.app to view the log file, it's listed in the ~/Library/Logs section.\n", [[LCLLogFile path] UTF8String]);


    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
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
