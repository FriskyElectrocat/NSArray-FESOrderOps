//
//  NSArray+FESOrderOps.m
//  FESOrderOpsDemo
//
//  Created by Dan Weeks on 2012-01-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdlib.h>

#import "NSArray+FESOrderOps.h"

@implementation NSArray (FESOrderOps)

// A basic Fisher-Yates Shuffle using the arc4random_uniform function
// for psuedorandom values. Returns a new NSArray with the new order.
// See http://en.wikipedia.org/wiki/Fisher–Yates_shuffle for more information.
- (NSArray *)fes_shuffle
{
    NSMutableArray *retArray = [self mutableCopy];
    NSUInteger count = [retArray count];
    for (NSUInteger i = count-1; i > 0; i--) {
        NSUInteger r = arc4random_uniform(i);
        if (r == i) {
            continue;
        }
        [retArray exchangeObjectAtIndex:i withObjectAtIndex:r];
    }
    return [retArray copy];
}

// takes the half-way point of a NSArray, and then keeps halfing the
// NSArray from there taking the half-way point until the NSArray is
// exhausted.  Returns a new NSArray with the new order.
- (NSArray *)fes_halfOrder
{
    NSMutableArray *retArray = [NSMutableArray new];
    NSUInteger selfCount = [self count];
    NSUInteger halfCount = selfCount / 2;
    if ([self count] <= 2) {
        return [self copy];
    }

    [retArray addObject:[self objectAtIndex:halfCount]];

    NSRange aRange = NSMakeRange(0, halfCount);
    NSRange bRange = NSMakeRange(halfCount+1, selfCount-(halfCount+1));
    NSMutableArray *aArray = [[[self subarrayWithRange:aRange] fes_halfOrder] mutableCopy];
    NSMutableArray *bArray = [[[self subarrayWithRange:bRange] fes_halfOrder] mutableCopy];

    [retArray addObject:[aArray objectAtIndex:0]];
    [aArray removeObjectAtIndex:0];
    [retArray addObject:[bArray objectAtIndex:0]];
    [bArray removeObjectAtIndex:0];

    while ([aArray count] > 0 && [bArray count] > 0) {
        [retArray addObject:[aArray objectAtIndex:0]];
        [aArray removeObjectAtIndex:0];
        [retArray addObject:[bArray objectAtIndex:0]];
        [bArray removeObjectAtIndex:0];        
    }

    if ([aArray count] > 0) {
        [retArray addObjectsFromArray:[aArray fes_halfOrder]];
    }
    if ([bArray count] > 0) {
        [retArray addObjectsFromArray:[bArray fes_halfOrder]];
    }

    return [retArray copy];
}

// 'dicing' idea. Takes the first and last element and
// then runs fes_halfOrder() on the remainder.  Returns an NSArray with
// the new order.
- (NSArray *)fes_dice
{
    NSMutableArray *retArray = [NSMutableArray new];
    [retArray addObject:[self objectAtIndex:0]];
    [retArray addObject:[self lastObject]];
    NSRange subRange = NSMakeRange(1, [self count]-2);
    [retArray addObjectsFromArray:[[self subarrayWithRange:subRange] fes_halfOrder]];
    return [retArray copy];
}

// starts at 0 position and rolls across the NSArray at
// specified intervals. When the source list is no longer 
// long enough to allow that size of a roll it will step 
// down to the next power of two until the list is exhausted.
// Returns an NSArray with the new order.
- (NSArray *)fes_rollWithPowerOfTwo:(int)power;
{
    NSMutableArray *workArray = [self mutableCopy];
    NSMutableArray *retArray = [NSMutableArray new];
    int powerEnd = 0;
    while (power >= powerEnd) {
        int e = (int)pow((double)2, (double)power);
        if (e > [workArray count]) {
            power--;
            continue;
        }
        int i = 0;
        while (i <= (int)([workArray count] - 1)) {
            [retArray addObject:[workArray objectAtIndex:i]];
            [workArray removeObjectAtIndex:i];
            i += e;
        }
        if ([workArray count] > e) {
            continue;
        }
        power--;
    }
    if ([workArray count] > 0) {
        [retArray addObjectsFromArray:workArray];
    }
    return [retArray copy];
}

// uses -(NSArray *)fes_rollWithPowerOfTwo:(NSUInteger)power to return
// a roll with a power of 5 (or 32). Consider this the default parameter
// version of fes_rollWithPowerOfTwo:
// Returns an NSArray with the new order
- (NSArray *)fes_roll
{
    return [self fes_rollWithPowerOfTwo:5];
}
@end
