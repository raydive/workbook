//
//  OOOAppDelegate.m
//  NSComparisonPredicate
//
//  Created by 大森 智史 on 2012/08/12.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate
#pragma mark NSPredicate:predicateWithFormat:
-(void)method001
{
    //age
    NSExpression *lhs = [NSExpression expressionForKeyPath:@"age"];
    
    //20
    NSExpression *greaterThanRhs = [NSExpression expressionForConstantValue:[NSNumber numberWithInt:20]];
    
    //age >= 20
    NSPredicate *greaterThanPredicate = [NSComparisonPredicate
                                         predicateWithLeftExpression:lhs
                                         rightExpression:greaterThanRhs
                                         modifier:NSDirectPredicateModifier
                                         type:NSGreaterThanOrEqualToPredicateOperatorType //>=
                                         options:0];
    
    //40
    NSExpression *lessThanRhs = [NSExpression expressionForConstantValue:[NSNumber numberWithInt:40]];
    //age < 40
    NSPredicate *lessThanPredicate = [NSComparisonPredicate
                                      predicateWithLeftExpression:lhs
                                      rightExpression:lessThanRhs
                                      modifier:NSDirectPredicateModifier
                                      type:NSLessThanPredicateOperatorType // <
                                      options:0];
    //age >= 20 AND age < 40
    NSPredicate *comPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:
                                      [NSArray arrayWithObjects:greaterThanPredicate, lessThanPredicate, nil]];

    NSDictionary *tanaka = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [NSNumber numberWithInt:30],@"age" ,
                            @"Tanaka",@"lastName",@"Taro",@"firstName",nil];
    NSDictionary *sato = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:43],@"age" ,
                          @"Sato",@"lastName",@"Satoko",@"firstName",nil];
    NSDictionary *suzuki = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [NSNumber numberWithInt:39],@"age" ,
                            @"Suzuki",@"lastName",@"Ichiro",@"firstName",nil];
    NSDictionary *yamada = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [NSNumber numberWithInt:12],@"age" ,
                            @"Yamada",@"lastName",@"Jiro",@"firstName",nil];
    
    NSArray *anArray =
    [[NSArray alloc] initWithObjects:tanaka,sato,suzuki,yamada,nil];
    
    NSArray *aResult = [anArray filteredArrayUsingPredicate:comPredicate];
    
    NSLog(@"%s %@",__FUNCTION__,[aResult description]);
    NSLog(@"%s %@", __FUNCTION__,[comPredicate predicateFormat]);
}

#pragma mark NSPredicate
-(void)method002
{
    //age
    NSExpression *lhs = [NSExpression expressionForKeyPath:@"age"];
    
    //20
    NSExpression *greaterThanRhs = [NSExpression expressionForConstantValue:[NSNumber numberWithInt:20]];
    
    //age = 20
    NSPredicate *greaterThanPredicate = [NSComparisonPredicate
                                         predicateWithLeftExpression:lhs
                                         rightExpression:greaterThanRhs
                                         customSelector:@selector(isEqual:)
                                         ];
    
    //40
    NSExpression *lessThanRhs = [NSExpression expressionForConstantValue:[NSNumber numberWithInt:40]];
    //age < 40
    NSPredicate *lessThanPredicate = [NSComparisonPredicate
                                      predicateWithLeftExpression:lhs
                                      rightExpression:lessThanRhs
                                      modifier:NSDirectPredicateModifier
                                      type:NSLessThanPredicateOperatorType // <
                                      options:0];
    //age >= 20 AND age < 40
    NSPredicate *comPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:
                                 [NSArray arrayWithObjects:greaterThanPredicate, lessThanPredicate, nil]];
    
    NSDictionary *tanaka = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [NSNumber numberWithInt:30],@"age" ,
                            @"Tanaka",@"lastName",@"Taro",@"firstName",nil];
    NSDictionary *sato = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:43],@"age" ,
                          @"Sato",@"lastName",@"Satoko",@"firstName",nil];
    NSDictionary *suzuki = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [NSNumber numberWithInt:39],@"age" ,
                            @"Suzuki",@"lastName",@"Ichiro",@"firstName",nil];
    NSDictionary *yamada = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [NSNumber numberWithInt:12],@"age" ,
                            @"Yamada",@"lastName",@"Jiro",@"firstName",nil];
    
    NSArray *anArray =
    [[NSArray alloc] initWithObjects:tanaka,sato,suzuki,yamada,nil];
    
    NSArray *aResult = [anArray filteredArrayUsingPredicate:comPredicate];
    
    NSLog(@"%s %@",__FUNCTION__,[aResult description]);
    NSLog(@"%s %@", __FUNCTION__,[comPredicate predicateFormat]);
    
    
    
}

#pragma mark NSPredicate
-(void)method003
{
    //age
    NSExpression *lhs = [NSExpression expressionForKeyPath:@"age"];
    
    //20
    NSExpression *greaterThanRhs = [NSExpression expressionForConstantValue:[NSNumber numberWithInt:20]];
    
    //age = 20
    NSPredicate *greaterThanPredicate = [NSComparisonPredicate
                                         predicateWithLeftExpression:lhs
                                         rightExpression:greaterThanRhs
                                         customSelector:@selector(isEqual:)
                                         ];
    
    //40
    NSExpression *lessThanRhs = [NSExpression expressionForConstantValue:[NSNumber numberWithInt:40]];
    //age < 40
    NSComparisonPredicate *lessThanPredicate = [[NSComparisonPredicate alloc]
                                      initWithLeftExpression:lhs
                                      rightExpression:lessThanRhs
                                      modifier:NSDirectPredicateModifier
                                      type:NSLessThanPredicateOperatorType // <
                                      options:(NSNormalizedPredicateOption)];
    //age >= 20 AND age < 40
    NSPredicate *comPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:
                                 [NSArray arrayWithObjects:greaterThanPredicate, lessThanPredicate, nil]];
    
    NSDictionary *tanaka = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [NSNumber numberWithInt:30],@"age" ,
                            @"Tanaka",@"lastName",@"Taro",@"firstName",nil];
    NSDictionary *sato = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:43],@"age" ,
                          @"Sato",@"lastName",@"Satoko",@"firstName",nil];
    NSDictionary *suzuki = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [NSNumber numberWithInt:39],@"age" ,
                            @"Suzuki",@"lastName",@"Ichiro",@"firstName",nil];
    NSDictionary *yamada = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [NSNumber numberWithInt:12],@"age" ,
                            @"Yamada",@"lastName",@"Jiro",@"firstName",nil];
    
    NSArray *anArray =
    [[NSArray alloc] initWithObjects:tanaka,sato,suzuki,yamada,nil];
    
    NSArray *aResult = [anArray filteredArrayUsingPredicate:comPredicate];
    
    NSLog(@"%s %@",__FUNCTION__,[aResult description]);
    NSLog(@"%s %@", __FUNCTION__,[comPredicate predicateFormat]);
    
    switch ([lessThanPredicate comparisonPredicateModifier]) {
        case NSDirectPredicateModifier:
            NSLog(@"NSDirectPredicateModifier");
            break;
        case NSAllPredicateModifier:
            NSLog(@"NSAllPredicateModifier");
            break;
        case NSAnyPredicateModifier:
                  NSLog(@"NSAnyPredicateModifier");
            break;
            
        default:
            break;
    }
    
    NSLog(@"%s %@", __FUNCTION__,NSStringFromSelector([lessThanPredicate customSelector]));
    
    NSLog(@"%s %@", __FUNCTION__,[lessThanPredicate leftExpression]);


    
    switch ([lessThanPredicate predicateOperatorType]) {
        case NSLessThanPredicateOperatorType:
            NSLog(@"NSLessThanPredicateOperatorType");
            break;
        case NSLessThanOrEqualToPredicateOperatorType:
            NSLog(@"NSLessThanOrEqualToPredicateOperatorType");
            break;
        case NSGreaterThanPredicateOperatorType:
            NSLog(@"NSGreaterThanPredicateOperatorType");
            break;
        case NSGreaterThanOrEqualToPredicateOperatorType:
            NSLog(@"NSGreaterThanOrEqualToPredicateOperatorType");
            break;
        case NSEqualToPredicateOperatorType:
            NSLog(@"NSEqualToPredicateOperatorType");
            break;
        case NSNotEqualToPredicateOperatorType:
            NSLog(@"NSNotEqualToPredicateOperatorType");
            break;
        case NSMatchesPredicateOperatorType:
            NSLog(@"NSMatchesPredicateOperatorType");
            break;
        case NSLikePredicateOperatorType:
            NSLog(@"NSLikePredicateOperatorType");
            break;
        case NSBeginsWithPredicateOperatorType:
            NSLog(@"NSBeginsWithPredicateOperatorType");
            break;
        case NSEndsWithPredicateOperatorType:
            NSLog(@"NSEndsWithPredicateOperatorType");
            break;
        case NSInPredicateOperatorType:
            NSLog(@"NSInPredicateOperatorType");
            break;
        case NSCustomSelectorPredicateOperatorType:
            NSLog(@"NSCustomSelectorPredicateOperatorType");
            break;
            
        default:
            break;
    }
    NSLog(@"%s %u", __FUNCTION__,[lessThanPredicate options]);
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    [self method002];
    
    [self method003];
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
