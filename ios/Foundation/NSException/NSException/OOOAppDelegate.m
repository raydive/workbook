//
//  OOOAppDelegate.m
//  NSException
//
//  Created by 大森 智史 on 2012/09/17.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"
#import "MyOperation.h"

@implementation OOOAppDelegate

#pragma mark addOperation:
//非並列
-(void)method001
{
    MyOperation *aOperation1 = [[MyOperation alloc] init];
    __block id temp = aOperation1;
    
    [aOperation1 setCompletionBlock:^{
        NSLog(@"%s->finished: %@",__FUNCTION__, ([temp finished])?@"YES":@"NO");
        temp= nil;
    }];
    [aOperation1 start];
    
    oQueue = [[NSOperationQueue alloc] init];
    
    MyOperation *aOperation2 = [[MyOperation alloc] init];
    
    aOperation1.string = @"aaa";
    aOperation2.string = @"bbb";
    
    //[oQueue addOperation:aOperation1];
    //[oQueue addOperation:aOperation2];
    
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
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
