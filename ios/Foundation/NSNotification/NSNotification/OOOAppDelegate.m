//
//  OOOAppDelegate.m
//  NSNotification
//
//  Created by 大森 智史 on 12/07/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    NSLog(@"%s (%.2f,%.2f)",__FUNCTION__,keyboardRect.origin.x,keyboardRect.origin.y);
}
- (void)keyboardWasHidden:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    id obj = [aNotification object];
    NSString *str = [aNotification name];
    NSLog(@"%s name=%@,obj=%@,info=%@ ",__FUNCTION__,str,[obj description],[info description]);
    
}
-(void)method001
{
    NSNotificationCenter *nCenter = [NSNotificationCenter defaultCenter];
    [nCenter addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [nCenter addObserver:self selector:@selector(keyboardWasHidden:) 
                    name:@"MyNotification" 
                  object:nil];
    
    [nCenter addObserver:self selector:@selector(keyboardWasHidden:) 
                    name:UIScreenBrightnessDidChangeNotification
                  object:nil];

    
    //通知を作る
    NSString *aString = [NSString stringWithString:@"String"];
    NSDictionary *aDic = [NSDictionary dictionaryWithObject:@"Object" forKey:@"key"];
    NSNotification *notifi = [NSNotification notificationWithName:@"MyNotification" object:aString userInfo:aDic];

    //通知センターに通知を送る
    [nCenter postNotification:notifi];
    
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
