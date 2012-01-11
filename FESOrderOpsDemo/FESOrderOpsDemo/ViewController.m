//
//  ViewController.m
//  FESOrderOpsDemo
//
//  Created by Dan Weeks on 2012-01-06.
//  Copyright © 2012 Dan Weeks/Frisky Electrocat Studio
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the “Software”), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "ViewController.h"

@implementation ViewController

@synthesize orderLabel = _orderLabel;
@synthesize listSource = _listSource;
@synthesize origList = _origList;
@synthesize tableView = _tableView;
@synthesize currentOrderIndex = _currentOrderIndex;
@synthesize orderList = _orderList;

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
    _currentOrderIndex = [NSNumber numberWithInteger:0];
    _orderList = [NSArray arrayWithObjects:@"None", @"Shuffle", @"Half Order", @"Dice", @"Roll 2^2", @"Roll 2^3", @"Roll (default 2^5)", nil];
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:100];
    for (int i = 0; i < 100; i++) {
        [tempArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    _origList = [NSArray arrayWithArray:tempArray];
    _listSource = [[self origList] copy];
    _orderLabel.text = [NSString stringWithFormat:@"%@", [[self orderList] objectAtIndex:[self.currentOrderIndex integerValue]]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
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

#pragma mark -
#pragma mark Table View Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"orderListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [[self listSource] objectAtIndex:row];
    return cell;
    
}

# pragma mark -

- (IBAction)nextOrder:(id)sender 
{
    if ([[self currentOrderIndex] integerValue] == [[self orderList] count] - 1) {
        _currentOrderIndex = 0;
    } else {
        _currentOrderIndex = [NSNumber numberWithInteger:[[self currentOrderIndex] integerValue] + 1];
    }

    switch ([[self currentOrderIndex] integerValue]) {
        case 1: // Shuffle
            _listSource = [[self origList] fes_shuffle];
            break;
        case 2:
            _listSource = [[self origList] fes_halfOrder];
            break;
        case 3:
            _listSource = [[self origList] fes_dice];
            break;
        case 4:
            _listSource = [[self origList] fes_rollWithPowerOfTwo:2];
            break;
        case 5:
            _listSource = [[self origList] fes_rollWithPowerOfTwo:3];
            break;
        case 6:
            _listSource = [[self origList] fes_roll];
            break;
        case 0:
        default:
            _listSource = [[self origList] copy];
            break;
    }
    _orderLabel.text = [[self orderList] objectAtIndex:[[self currentOrderIndex] integerValue]];

    [[self tableView] reloadData];
}

@end
