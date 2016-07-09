//
//  PackagingTests.m
//  PackagingTests
//
//  Created by Joan Molinas Ramon on 9/7/16.
//  Copyright © 2016 Joan Molinas. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Packaging.h"

@interface PackagingTests : XCTestCase
@property (nonatomic, strong) Packaging *queue;
@end

@implementation PackagingTests

- (void)setUp {
    [super setUp];
    
    self.queue = [[Packaging alloc] initWithSizeOfPackages:6];
    for (int i = 0; i < 22; i++) {
        [self.queue addElement:[NSNumber numberWithInt:i]];
    }
}

- (void)testCount {
    XCTAssertEqual([self.queue size], 22);
}

- (void)testCountAddingArray {
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 22; i < 30; i++) {
        [arr addObject:[NSNumber numberWithInt:i]];
    }
    
    [self.queue addElements:arr];
    XCTAssertEqual([self.queue size], 30);
}

- (void)testEqualArrays {
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 22; i < 30; i++) {
        [arr addObject:[NSNumber numberWithInt:i]];
    }
    [self.queue addElements:arr];
    
    arr = [NSMutableArray new];
    for (int i = 0; i < 30; i++) {
        [arr addObject:[NSNumber numberWithInt:i]];
    }
    XCTAssertEqualObjects([self.queue all], arr);
}

- (void)testFirstPackage {
    NSArray *arr = [self.queue getPackage];
    NSArray *expect = @[[NSNumber numberWithInt:16], [NSNumber numberWithInt:17], [NSNumber numberWithInt:18], [NSNumber numberWithInt:19], [NSNumber numberWithInt:20], [NSNumber numberWithInt:21]];
    XCTAssertEqualObjects(arr, expect);
}

- (void)testSecondPackage {
    NSArray *arr = [self.queue getPackage];
    arr = [self.queue getPackage];
    NSArray *expect = @[[NSNumber numberWithInt:10], [NSNumber numberWithInt:11], [NSNumber numberWithInt:12], [NSNumber numberWithInt:13], [NSNumber numberWithInt:14], [NSNumber numberWithInt:15]];
    XCTAssertEqualObjects(arr, expect);
}

- (void)testThreePackage {
    NSArray *arr = [self.queue getPackage];
    arr = [self.queue getPackage];
    arr = [self.queue getPackage];
    NSArray *expect = @[[NSNumber numberWithInt:4], [NSNumber numberWithInt:5], [NSNumber numberWithInt:6], [NSNumber numberWithInt:7], [NSNumber numberWithInt:8], [NSNumber numberWithInt:9]];
    XCTAssertEqualObjects(arr, expect);
}

- (void)testLastPackage {
    NSArray *arr = [self.queue getPackage];
    arr = [self.queue getPackage];
    arr = [self.queue getPackage];
    arr = [self.queue getPackage];
    NSArray *expect = @[[NSNumber numberWithInt:0], [NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3]];
    XCTAssertEqualObjects(arr, expect);
}

- (void)testNoMorePackages {
    NSArray *arr = [self.queue getPackage];
    arr = [self.queue getPackage];
    arr = [self.queue getPackage];
    arr = [self.queue getPackage];
    arr = [self.queue getPackage];
    NSArray *expect = @[];
    XCTAssertEqualObjects(arr, expect);
}
- (void)testChangingSizeOfPackage {
    NSArray *arr = [self.queue getPackage];
    arr = [self.queue getPackage];
    
    self.queue.sizeOfPackage = 2;
    arr = [self.queue getPackage];
    NSArray *twoElem = @[[NSNumber numberWithInt:8], [NSNumber numberWithInt:9]];
    XCTAssertEqualObjects(arr, twoElem);
    
    self.queue.sizeOfPackage = 6;
    arr = [self.queue getPackage];
    NSArray *expect = @[[NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], [NSNumber numberWithInt:6], [NSNumber numberWithInt:7]];
    XCTAssertEqualObjects(arr, expect);
}

@end
