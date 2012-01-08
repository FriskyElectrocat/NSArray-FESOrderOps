//
//  NSArray+FESOrderOps.h
//  FESOrderOpsDemo
//
//  Created by Dan Weeks on 2012-01-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (FESOrderOps)
- (NSArray *)fes_shuffle;
- (NSArray *)fes_halfOrder;
- (NSArray *)fes_dice;
- (NSArray *)fes_rollWithPowerOfTwo:(int)power;
- (NSArray *)fes_roll;
@end
