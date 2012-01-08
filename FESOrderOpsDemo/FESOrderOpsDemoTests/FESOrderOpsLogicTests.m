//
//  FESOrderOpsDemoTests.m
//  FESOrderOpsDemoTests
//
//  Created by Dan Weeks on 2012-01-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FESOrderOpsLogicTests.h"
#import "NSArray+FESOrderOps.h"

# define TEST_ARRAY_LENGTH_1 20
# define TEST_ARRAY_LENGTH_2 100

@implementation FESOrderOpsLogicTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

//- (void)testExample
//{
//    STFail(@"Unit tests are not implemented yet in FESOrderOpsDemoTests");
//}

// make sure an array once shuffled is not the same as the source
- (void)testFESOrderOps_shuffle1
{
    NSMutableArray *buildArray = [NSMutableArray new];
    for (int i=0; i<TEST_ARRAY_LENGTH_1; i++) {
        [buildArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    NSArray *testArray = [buildArray copy];
    NSArray *shuffledArray = [testArray fes_shuffle];
    if ([testArray isEqualToArray:shuffledArray]) {
        STFail(@"Shuffle Array Test 1 failed, arrays are equal:\n%@\n%@", testArray, shuffledArray);
    }
}

// Make sure that shuffling the same array twice produces different results
- (void)testFESOrderOps_shuffle2
{
    NSMutableArray *buildArray = [NSMutableArray new];
    for (int i=0; i<TEST_ARRAY_LENGTH_1; i++) {
        [buildArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    NSArray *testArray = [buildArray copy];
    NSArray *shuffledArray1 = [testArray fes_shuffle];
    NSArray *shuffledArray2 = [testArray fes_shuffle];
    if ([shuffledArray1 isEqualToArray:shuffledArray2]) {
        STFail(@"Shuffle Array Test 2 failed, arrays are equal:\n%@\n%@", shuffledArray1, shuffledArray2);
    }    
}

// test the halfOrder ability of an array
- (void)testFESOrderOps_halfOrder1
{
    NSMutableArray *buildArray = [NSMutableArray new];
    for (int i=0; i<TEST_ARRAY_LENGTH_1; i++) {
        [buildArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    NSArray *testArray = [buildArray copy];
    NSArray *orderedArray = [testArray fes_halfOrder];
    if ([testArray isEqualToArray:orderedArray]) {
        STFail(@"HalfOrder Array Test 1 failed, arrays are equal:\n%@\n%@", testArray, orderedArray);
    }
    NSArray *resultArray = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%d",10],
                                                     [NSString stringWithFormat:@"%d",5],
                                                     [NSString stringWithFormat:@"%d",15],
                                                     [NSString stringWithFormat:@"%d",2],
                                                     [NSString stringWithFormat:@"%d",13],
                                                     [NSString stringWithFormat:@"%d",8],
                                                     [NSString stringWithFormat:@"%d",18],
                                                     [NSString stringWithFormat:@"%d",0],
                                                     [NSString stringWithFormat:@"%d",11],
                                                     [NSString stringWithFormat:@"%d",6],
                                                     [NSString stringWithFormat:@"%d",16],
                                                     [NSString stringWithFormat:@"%d",3],
                                                     [NSString stringWithFormat:@"%d",14],
                                                     [NSString stringWithFormat:@"%d",9],
                                                     [NSString stringWithFormat:@"%d",19],
                                                     [NSString stringWithFormat:@"%d",1],
                                                     [NSString stringWithFormat:@"%d",12],
                                                     [NSString stringWithFormat:@"%d",7],
                                                     [NSString stringWithFormat:@"%d",17],
                                                     [NSString stringWithFormat:@"%d",4],
                                                     nil];
    STAssertEqualObjects(resultArray, orderedArray, @"HalfOrder Array Test 1 failed, result array and generated array are inequal");
}


//- (void)testFESHalfOrder2
//{
//    
//}

// test the dicing ability of an array (first, last, halfOrder remainder)
- (void)testFESOrderOps_dice1
{
    NSMutableArray *buildArray = [NSMutableArray new];
    for (int i=0; i<TEST_ARRAY_LENGTH_1; i++) {
        [buildArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    NSArray *testArray = [buildArray copy];
    NSArray *orderedArray = [testArray fes_dice];
    if ([testArray isEqualToArray:orderedArray]) {
        STFail(@"Dice Array Test 1 failed, arrays are equal:\n%@\n%@", testArray, orderedArray);
    }
    NSArray *resultArray = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%d",0],
                            [NSString stringWithFormat:@"%d",19],
                            [NSString stringWithFormat:@"%d",10],
                            [NSString stringWithFormat:@"%d",5],
                            [NSString stringWithFormat:@"%d",15],
                            [NSString stringWithFormat:@"%d",3],
                            [NSString stringWithFormat:@"%d",13],
                            [NSString stringWithFormat:@"%d",8],
                            [NSString stringWithFormat:@"%d",17],
                            [NSString stringWithFormat:@"%d",1],
                            [NSString stringWithFormat:@"%d",11],
                            [NSString stringWithFormat:@"%d",6],
                            [NSString stringWithFormat:@"%d",16],
                            [NSString stringWithFormat:@"%d",4],
                            [NSString stringWithFormat:@"%d",14],
                            [NSString stringWithFormat:@"%d",9],
                            [NSString stringWithFormat:@"%d",18],
                            [NSString stringWithFormat:@"%d",2],
                            [NSString stringWithFormat:@"%d",12],
                            [NSString stringWithFormat:@"%d",7],
                            nil];
    STAssertEqualObjects(resultArray, orderedArray, @"Dice Array Test 1 failed, result array and generated array are inequal");
}

// do a power of two roll over an array 
- (void)testFESOrderOps_rollWithPowerOfTwo1
{
    // power of 5
    NSMutableArray *buildArray = [NSMutableArray new];
    for (int i=0; i<TEST_ARRAY_LENGTH_2; i++) {
        [buildArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    NSArray *testArray = [buildArray copy];
    NSArray *orderedArray = [testArray fes_rollWithPowerOfTwo:5];
    
    if ([testArray isEqualToArray:orderedArray]) {
        STFail(@"Roll PowerOfTwo Array Test 1 failed, arrays are equal:\n%@\n%@", testArray, orderedArray);
    }
    NSArray *resultArray = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%d",0],
                            [NSString stringWithFormat:@"%d",33],
                            [NSString stringWithFormat:@"%d",66],
                            [NSString stringWithFormat:@"%d",99],
                            [NSString stringWithFormat:@"%d",1],
                            [NSString stringWithFormat:@"%d",35],
                            [NSString stringWithFormat:@"%d",69],
                            [NSString stringWithFormat:@"%d",2],
                            [NSString stringWithFormat:@"%d",37],
                            [NSString stringWithFormat:@"%d",72],
                            [NSString stringWithFormat:@"%d",3],
                            [NSString stringWithFormat:@"%d",39],
                            [NSString stringWithFormat:@"%d",75],
                            [NSString stringWithFormat:@"%d",4],
                            [NSString stringWithFormat:@"%d",41],
                            [NSString stringWithFormat:@"%d",78],
                            [NSString stringWithFormat:@"%d",5],
                            [NSString stringWithFormat:@"%d",43],
                            [NSString stringWithFormat:@"%d",81],
                            [NSString stringWithFormat:@"%d",6],
                            [NSString stringWithFormat:@"%d",45],
                            [NSString stringWithFormat:@"%d",84],
                            [NSString stringWithFormat:@"%d",7],
                            [NSString stringWithFormat:@"%d",47],
                            [NSString stringWithFormat:@"%d",87],
                            [NSString stringWithFormat:@"%d",8],
                            [NSString stringWithFormat:@"%d",49],
                            [NSString stringWithFormat:@"%d",90],
                            [NSString stringWithFormat:@"%d",9],
                            [NSString stringWithFormat:@"%d",51],
                            [NSString stringWithFormat:@"%d",93],
                            [NSString stringWithFormat:@"%d",10],
                            [NSString stringWithFormat:@"%d",53],
                            [NSString stringWithFormat:@"%d",96],
                            [NSString stringWithFormat:@"%d",11],
                            [NSString stringWithFormat:@"%d",55],
                            [NSString stringWithFormat:@"%d",12],
                            [NSString stringWithFormat:@"%d",57],
                            [NSString stringWithFormat:@"%d",13],
                            [NSString stringWithFormat:@"%d",59],
                            [NSString stringWithFormat:@"%d",14],
                            [NSString stringWithFormat:@"%d",61],
                            [NSString stringWithFormat:@"%d",15],
                            [NSString stringWithFormat:@"%d",63],
                            [NSString stringWithFormat:@"%d",16],
                            [NSString stringWithFormat:@"%d",65],
                            [NSString stringWithFormat:@"%d",17],
                            [NSString stringWithFormat:@"%d",68],
                            [NSString stringWithFormat:@"%d",18],
                            [NSString stringWithFormat:@"%d",71],
                            [NSString stringWithFormat:@"%d",19],
                            [NSString stringWithFormat:@"%d",74],
                            [NSString stringWithFormat:@"%d",20],
                            [NSString stringWithFormat:@"%d",77],
                            [NSString stringWithFormat:@"%d",21],
                            [NSString stringWithFormat:@"%d",80],
                            [NSString stringWithFormat:@"%d",22],
                            [NSString stringWithFormat:@"%d",83],
                            [NSString stringWithFormat:@"%d",23],
                            [NSString stringWithFormat:@"%d",86],
                            [NSString stringWithFormat:@"%d",24],
                            [NSString stringWithFormat:@"%d",89],
                            [NSString stringWithFormat:@"%d",25],
                            [NSString stringWithFormat:@"%d",92],
                            [NSString stringWithFormat:@"%d",26],
                            [NSString stringWithFormat:@"%d",95],
                            [NSString stringWithFormat:@"%d",27],
                            [NSString stringWithFormat:@"%d",98],
                            [NSString stringWithFormat:@"%d",28],
                            [NSString stringWithFormat:@"%d",58],
                            [NSString stringWithFormat:@"%d",29],
                            [NSString stringWithFormat:@"%d",62],
                            [NSString stringWithFormat:@"%d",30],
                            [NSString stringWithFormat:@"%d",67],
                            [NSString stringWithFormat:@"%d",31],
                            [NSString stringWithFormat:@"%d",73],
                            [NSString stringWithFormat:@"%d",32],
                            [NSString stringWithFormat:@"%d",79],
                            [NSString stringWithFormat:@"%d",34],
                            [NSString stringWithFormat:@"%d",85],
                            [NSString stringWithFormat:@"%d",36],
                            [NSString stringWithFormat:@"%d",91],
                            [NSString stringWithFormat:@"%d",38],
                            [NSString stringWithFormat:@"%d",97],
                            [NSString stringWithFormat:@"%d",40],
                            [NSString stringWithFormat:@"%d",60],
                            [NSString stringWithFormat:@"%d",42],
                            [NSString stringWithFormat:@"%d",70],
                            [NSString stringWithFormat:@"%d",44],
                            [NSString stringWithFormat:@"%d",82],
                            [NSString stringWithFormat:@"%d",46],
                            [NSString stringWithFormat:@"%d",94],
                            [NSString stringWithFormat:@"%d",48],
                            [NSString stringWithFormat:@"%d",64],
                            [NSString stringWithFormat:@"%d",50],
                            [NSString stringWithFormat:@"%d",88],
                            [NSString stringWithFormat:@"%d",52],
                            [NSString stringWithFormat:@"%d",76],
                            [NSString stringWithFormat:@"%d",54],
                            [NSString stringWithFormat:@"%d",56],
                            nil];
    STAssertEqualObjects(resultArray, orderedArray, @"Roll PowerOfTwo Array Test 1 failed, result array and generated array are inequal");
}

- (void)testFESOrderOps_rollWithPowerOfTwo2
{
    // power of 3
    NSMutableArray *buildArray = [NSMutableArray new];
    for (int i=0; i<TEST_ARRAY_LENGTH_2; i++) {
        [buildArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    NSArray *testArray = [buildArray copy];
    NSArray *orderedArray = [testArray fes_rollWithPowerOfTwo:3];
    
    if ([testArray isEqualToArray:orderedArray]) {
        STFail(@"Roll PowerOfTwo Array Test 2 failed, arrays are equal:\n%@\n%@", testArray, orderedArray);
    }
    NSArray *resultArray = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%d",0],
                            [NSString stringWithFormat:@"%d",9],
                            [NSString stringWithFormat:@"%d",18],
                            [NSString stringWithFormat:@"%d",27],
                            [NSString stringWithFormat:@"%d",36],
                            [NSString stringWithFormat:@"%d",45],
                            [NSString stringWithFormat:@"%d",54],
                            [NSString stringWithFormat:@"%d",63],
                            [NSString stringWithFormat:@"%d",72],
                            [NSString stringWithFormat:@"%d",81],
                            [NSString stringWithFormat:@"%d",90],
                            [NSString stringWithFormat:@"%d",99],
                            [NSString stringWithFormat:@"%d",1],
                            [NSString stringWithFormat:@"%d",11],
                            [NSString stringWithFormat:@"%d",21],
                            [NSString stringWithFormat:@"%d",31],
                            [NSString stringWithFormat:@"%d",41],
                            [NSString stringWithFormat:@"%d",51],
                            [NSString stringWithFormat:@"%d",61],
                            [NSString stringWithFormat:@"%d",71],
                            [NSString stringWithFormat:@"%d",82],
                            [NSString stringWithFormat:@"%d",92],
                            [NSString stringWithFormat:@"%d",2],
                            [NSString stringWithFormat:@"%d",13],
                            [NSString stringWithFormat:@"%d",24],
                            [NSString stringWithFormat:@"%d",35],
                            [NSString stringWithFormat:@"%d",47],
                            [NSString stringWithFormat:@"%d",58],
                            [NSString stringWithFormat:@"%d",69],
                            [NSString stringWithFormat:@"%d",80],
                            [NSString stringWithFormat:@"%d",93],
                            [NSString stringWithFormat:@"%d",3],
                            [NSString stringWithFormat:@"%d",15],
                            [NSString stringWithFormat:@"%d",28],
                            [NSString stringWithFormat:@"%d",40],
                            [NSString stringWithFormat:@"%d",53],
                            [NSString stringWithFormat:@"%d",66],
                            [NSString stringWithFormat:@"%d",78],
                            [NSString stringWithFormat:@"%d",91],
                            [NSString stringWithFormat:@"%d",4],
                            [NSString stringWithFormat:@"%d",17],
                            [NSString stringWithFormat:@"%d",32],
                            [NSString stringWithFormat:@"%d",46],
                            [NSString stringWithFormat:@"%d",60],
                            [NSString stringWithFormat:@"%d",75],
                            [NSString stringWithFormat:@"%d",88],
                            [NSString stringWithFormat:@"%d",5],
                            [NSString stringWithFormat:@"%d",20],
                            [NSString stringWithFormat:@"%d",37],
                            [NSString stringWithFormat:@"%d",52],
                            [NSString stringWithFormat:@"%d",68],
                            [NSString stringWithFormat:@"%d",85],
                            [NSString stringWithFormat:@"%d",6],
                            [NSString stringWithFormat:@"%d",23],
                            [NSString stringWithFormat:@"%d",42],
                            [NSString stringWithFormat:@"%d",59],
                            [NSString stringWithFormat:@"%d",77],
                            [NSString stringWithFormat:@"%d",96],
                            [NSString stringWithFormat:@"%d",7],
                            [NSString stringWithFormat:@"%d",26],
                            [NSString stringWithFormat:@"%d",48],
                            [NSString stringWithFormat:@"%d",67],
                            [NSString stringWithFormat:@"%d",87],
                            [NSString stringWithFormat:@"%d",8],
                            [NSString stringWithFormat:@"%d",30],
                            [NSString stringWithFormat:@"%d",55],
                            [NSString stringWithFormat:@"%d",76],
                            [NSString stringWithFormat:@"%d",98],
                            [NSString stringWithFormat:@"%d",10],
                            [NSString stringWithFormat:@"%d",34],
                            [NSString stringWithFormat:@"%d",62],
                            [NSString stringWithFormat:@"%d",86],
                            [NSString stringWithFormat:@"%d",12],
                            [NSString stringWithFormat:@"%d",39],
                            [NSString stringWithFormat:@"%d",70],
                            [NSString stringWithFormat:@"%d",97],
                            [NSString stringWithFormat:@"%d",14],
                            [NSString stringWithFormat:@"%d",44],
                            [NSString stringWithFormat:@"%d",79],
                            [NSString stringWithFormat:@"%d",16],
                            [NSString stringWithFormat:@"%d",50],
                            [NSString stringWithFormat:@"%d",89],
                            [NSString stringWithFormat:@"%d",19],
                            [NSString stringWithFormat:@"%d",57],
                            [NSString stringWithFormat:@"%d",22],
                            [NSString stringWithFormat:@"%d",65],
                            [NSString stringWithFormat:@"%d",25],
                            [NSString stringWithFormat:@"%d",74],
                            [NSString stringWithFormat:@"%d",29],
                            [NSString stringWithFormat:@"%d",84],
                            [NSString stringWithFormat:@"%d",33],
                            [NSString stringWithFormat:@"%d",95],
                            [NSString stringWithFormat:@"%d",38],
                            [NSString stringWithFormat:@"%d",73],
                            [NSString stringWithFormat:@"%d",43],
                            [NSString stringWithFormat:@"%d",94],
                            [NSString stringWithFormat:@"%d",49],
                            [NSString stringWithFormat:@"%d",83],
                            [NSString stringWithFormat:@"%d",56],
                            [NSString stringWithFormat:@"%d",64],
                            nil];
    STAssertEqualObjects(resultArray, orderedArray, @"Roll PowerOfTwo Array Test 2 failed, result array and generated array are inequal");
}

- (void)testFESOrderOps_rollWithPowerOfTwo3
{
    // power of 10
    NSMutableArray *buildArray = [NSMutableArray new];
    for (int i=0; i<TEST_ARRAY_LENGTH_2; i++) {
        [buildArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    NSArray *testArray = [buildArray copy];
    NSArray *orderedArray = [testArray fes_rollWithPowerOfTwo:10];
    
    if ([testArray isEqualToArray:orderedArray]) {
        STFail(@"Roll PowerOfTwo Array Test 3 failed, arrays are equal:\n%@\n%@", testArray, orderedArray);
    }
    NSArray *resultArray = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%d",0],
                            [NSString stringWithFormat:@"%d",65],
                            [NSString stringWithFormat:@"%d",1],
                            [NSString stringWithFormat:@"%d",67],
                            [NSString stringWithFormat:@"%d",2],
                            [NSString stringWithFormat:@"%d",69],
                            [NSString stringWithFormat:@"%d",3],
                            [NSString stringWithFormat:@"%d",71],
                            [NSString stringWithFormat:@"%d",4],
                            [NSString stringWithFormat:@"%d",73],
                            [NSString stringWithFormat:@"%d",5],
                            [NSString stringWithFormat:@"%d",75],
                            [NSString stringWithFormat:@"%d",6],
                            [NSString stringWithFormat:@"%d",77],
                            [NSString stringWithFormat:@"%d",7],
                            [NSString stringWithFormat:@"%d",79],
                            [NSString stringWithFormat:@"%d",8],
                            [NSString stringWithFormat:@"%d",81],
                            [NSString stringWithFormat:@"%d",9],
                            [NSString stringWithFormat:@"%d",83],
                            [NSString stringWithFormat:@"%d",10],
                            [NSString stringWithFormat:@"%d",85],
                            [NSString stringWithFormat:@"%d",11],
                            [NSString stringWithFormat:@"%d",87],
                            [NSString stringWithFormat:@"%d",12],
                            [NSString stringWithFormat:@"%d",89],
                            [NSString stringWithFormat:@"%d",13],
                            [NSString stringWithFormat:@"%d",91],
                            [NSString stringWithFormat:@"%d",14],
                            [NSString stringWithFormat:@"%d",93],
                            [NSString stringWithFormat:@"%d",15],
                            [NSString stringWithFormat:@"%d",95],
                            [NSString stringWithFormat:@"%d",16],
                            [NSString stringWithFormat:@"%d",97],
                            [NSString stringWithFormat:@"%d",17],
                            [NSString stringWithFormat:@"%d",99],
                            [NSString stringWithFormat:@"%d",18],
                            [NSString stringWithFormat:@"%d",51],
                            [NSString stringWithFormat:@"%d",19],
                            [NSString stringWithFormat:@"%d",53],
                            [NSString stringWithFormat:@"%d",20],
                            [NSString stringWithFormat:@"%d",55],
                            [NSString stringWithFormat:@"%d",21],
                            [NSString stringWithFormat:@"%d",57],
                            [NSString stringWithFormat:@"%d",22],
                            [NSString stringWithFormat:@"%d",59],
                            [NSString stringWithFormat:@"%d",23],
                            [NSString stringWithFormat:@"%d",61],
                            [NSString stringWithFormat:@"%d",24],
                            [NSString stringWithFormat:@"%d",63],
                            [NSString stringWithFormat:@"%d",25],
                            [NSString stringWithFormat:@"%d",66],
                            [NSString stringWithFormat:@"%d",26],
                            [NSString stringWithFormat:@"%d",70],
                            [NSString stringWithFormat:@"%d",27],
                            [NSString stringWithFormat:@"%d",74],
                            [NSString stringWithFormat:@"%d",28],
                            [NSString stringWithFormat:@"%d",78],
                            [NSString stringWithFormat:@"%d",29],
                            [NSString stringWithFormat:@"%d",82],
                            [NSString stringWithFormat:@"%d",30],
                            [NSString stringWithFormat:@"%d",86],
                            [NSString stringWithFormat:@"%d",31],
                            [NSString stringWithFormat:@"%d",90],
                            [NSString stringWithFormat:@"%d",32],
                            [NSString stringWithFormat:@"%d",94],
                            [NSString stringWithFormat:@"%d",33],
                            [NSString stringWithFormat:@"%d",98],
                            [NSString stringWithFormat:@"%d",34],
                            [NSString stringWithFormat:@"%d",52],
                            [NSString stringWithFormat:@"%d",35],
                            [NSString stringWithFormat:@"%d",56],
                            [NSString stringWithFormat:@"%d",36],
                            [NSString stringWithFormat:@"%d",60],
                            [NSString stringWithFormat:@"%d",37],
                            [NSString stringWithFormat:@"%d",64],
                            [NSString stringWithFormat:@"%d",38],
                            [NSString stringWithFormat:@"%d",72],
                            [NSString stringWithFormat:@"%d",39],
                            [NSString stringWithFormat:@"%d",80],
                            [NSString stringWithFormat:@"%d",40],
                            [NSString stringWithFormat:@"%d",88],
                            [NSString stringWithFormat:@"%d",41],
                            [NSString stringWithFormat:@"%d",96],
                            [NSString stringWithFormat:@"%d",42],
                            [NSString stringWithFormat:@"%d",54],
                            [NSString stringWithFormat:@"%d",43],
                            [NSString stringWithFormat:@"%d",62],
                            [NSString stringWithFormat:@"%d",44],
                            [NSString stringWithFormat:@"%d",76],
                            [NSString stringWithFormat:@"%d",45],
                            [NSString stringWithFormat:@"%d",92],
                            [NSString stringWithFormat:@"%d",46],
                            [NSString stringWithFormat:@"%d",58],
                            [NSString stringWithFormat:@"%d",47],
                            [NSString stringWithFormat:@"%d",84],
                            [NSString stringWithFormat:@"%d",48],
                            [NSString stringWithFormat:@"%d",68],
                            [NSString stringWithFormat:@"%d",49],
                            [NSString stringWithFormat:@"%d",50],
                            nil];
    STAssertEqualObjects(resultArray, orderedArray, @"Roll PowerOfTwo Array Test 3 failed, result array and generated array are inequal");
}

- (void)testFESOrderOps_roll1
{
    // power of 5
    NSMutableArray *buildArray = [NSMutableArray new];
    for (int i=0; i<TEST_ARRAY_LENGTH_2; i++) {
        [buildArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    NSArray *testArray = [buildArray copy];
    NSArray *orderedArray = [testArray fes_roll];    
    
    if ([testArray isEqualToArray:orderedArray]) {
        STFail(@"Roll Array Test 1 failed, arrays are equal:\n%@\n%@", testArray, orderedArray);
    }
    NSArray *resultArray = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%d",0],
                            [NSString stringWithFormat:@"%d",33],
                            [NSString stringWithFormat:@"%d",66],
                            [NSString stringWithFormat:@"%d",99],
                            [NSString stringWithFormat:@"%d",1],
                            [NSString stringWithFormat:@"%d",35],
                            [NSString stringWithFormat:@"%d",69],
                            [NSString stringWithFormat:@"%d",2],
                            [NSString stringWithFormat:@"%d",37],
                            [NSString stringWithFormat:@"%d",72],
                            [NSString stringWithFormat:@"%d",3],
                            [NSString stringWithFormat:@"%d",39],
                            [NSString stringWithFormat:@"%d",75],
                            [NSString stringWithFormat:@"%d",4],
                            [NSString stringWithFormat:@"%d",41],
                            [NSString stringWithFormat:@"%d",78],
                            [NSString stringWithFormat:@"%d",5],
                            [NSString stringWithFormat:@"%d",43],
                            [NSString stringWithFormat:@"%d",81],
                            [NSString stringWithFormat:@"%d",6],
                            [NSString stringWithFormat:@"%d",45],
                            [NSString stringWithFormat:@"%d",84],
                            [NSString stringWithFormat:@"%d",7],
                            [NSString stringWithFormat:@"%d",47],
                            [NSString stringWithFormat:@"%d",87],
                            [NSString stringWithFormat:@"%d",8],
                            [NSString stringWithFormat:@"%d",49],
                            [NSString stringWithFormat:@"%d",90],
                            [NSString stringWithFormat:@"%d",9],
                            [NSString stringWithFormat:@"%d",51],
                            [NSString stringWithFormat:@"%d",93],
                            [NSString stringWithFormat:@"%d",10],
                            [NSString stringWithFormat:@"%d",53],
                            [NSString stringWithFormat:@"%d",96],
                            [NSString stringWithFormat:@"%d",11],
                            [NSString stringWithFormat:@"%d",55],
                            [NSString stringWithFormat:@"%d",12],
                            [NSString stringWithFormat:@"%d",57],
                            [NSString stringWithFormat:@"%d",13],
                            [NSString stringWithFormat:@"%d",59],
                            [NSString stringWithFormat:@"%d",14],
                            [NSString stringWithFormat:@"%d",61],
                            [NSString stringWithFormat:@"%d",15],
                            [NSString stringWithFormat:@"%d",63],
                            [NSString stringWithFormat:@"%d",16],
                            [NSString stringWithFormat:@"%d",65],
                            [NSString stringWithFormat:@"%d",17],
                            [NSString stringWithFormat:@"%d",68],
                            [NSString stringWithFormat:@"%d",18],
                            [NSString stringWithFormat:@"%d",71],
                            [NSString stringWithFormat:@"%d",19],
                            [NSString stringWithFormat:@"%d",74],
                            [NSString stringWithFormat:@"%d",20],
                            [NSString stringWithFormat:@"%d",77],
                            [NSString stringWithFormat:@"%d",21],
                            [NSString stringWithFormat:@"%d",80],
                            [NSString stringWithFormat:@"%d",22],
                            [NSString stringWithFormat:@"%d",83],
                            [NSString stringWithFormat:@"%d",23],
                            [NSString stringWithFormat:@"%d",86],
                            [NSString stringWithFormat:@"%d",24],
                            [NSString stringWithFormat:@"%d",89],
                            [NSString stringWithFormat:@"%d",25],
                            [NSString stringWithFormat:@"%d",92],
                            [NSString stringWithFormat:@"%d",26],
                            [NSString stringWithFormat:@"%d",95],
                            [NSString stringWithFormat:@"%d",27],
                            [NSString stringWithFormat:@"%d",98],
                            [NSString stringWithFormat:@"%d",28],
                            [NSString stringWithFormat:@"%d",58],
                            [NSString stringWithFormat:@"%d",29],
                            [NSString stringWithFormat:@"%d",62],
                            [NSString stringWithFormat:@"%d",30],
                            [NSString stringWithFormat:@"%d",67],
                            [NSString stringWithFormat:@"%d",31],
                            [NSString stringWithFormat:@"%d",73],
                            [NSString stringWithFormat:@"%d",32],
                            [NSString stringWithFormat:@"%d",79],
                            [NSString stringWithFormat:@"%d",34],
                            [NSString stringWithFormat:@"%d",85],
                            [NSString stringWithFormat:@"%d",36],
                            [NSString stringWithFormat:@"%d",91],
                            [NSString stringWithFormat:@"%d",38],
                            [NSString stringWithFormat:@"%d",97],
                            [NSString stringWithFormat:@"%d",40],
                            [NSString stringWithFormat:@"%d",60],
                            [NSString stringWithFormat:@"%d",42],
                            [NSString stringWithFormat:@"%d",70],
                            [NSString stringWithFormat:@"%d",44],
                            [NSString stringWithFormat:@"%d",82],
                            [NSString stringWithFormat:@"%d",46],
                            [NSString stringWithFormat:@"%d",94],
                            [NSString stringWithFormat:@"%d",48],
                            [NSString stringWithFormat:@"%d",64],
                            [NSString stringWithFormat:@"%d",50],
                            [NSString stringWithFormat:@"%d",88],
                            [NSString stringWithFormat:@"%d",52],
                            [NSString stringWithFormat:@"%d",76],
                            [NSString stringWithFormat:@"%d",54],
                            [NSString stringWithFormat:@"%d",56],
                            nil];
    STAssertEqualObjects(resultArray, orderedArray, @"Roll Array Test 1 failed, result array and generated array are inequal");
    NSArray *rollArray = [testArray fes_rollWithPowerOfTwo:5];
    STAssertEqualObjects(rollArray, orderedArray, @"Roll Array Test 1 failed, fes_rollWithPowerOfTwo:5 array and generated array are inequal");
}
@end
