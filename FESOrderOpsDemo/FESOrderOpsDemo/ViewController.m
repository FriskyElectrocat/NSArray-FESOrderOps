//
//  ViewController.m
//  FESOrderOpsDemo
//
//  Created by Dan Weeks on 2012-01-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize theLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSArray *newArray = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", nil];
    NSArray *shuffledArray = [newArray fes_shuffle];
    theLabel.text = [NSString stringWithFormat:@"%@", shuffledArray];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
