//
//  OOOViewController.m
//  NSMutableSet
//
//  Created by 大森 智史 on 2012/08/04.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOViewController.h"

@interface OOOViewController ()

@end

@implementation OOOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
