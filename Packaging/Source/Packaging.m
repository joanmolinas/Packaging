//
//  Packaging.m
//  Packaging
//
//  Created by Joan Molinas Ramon on 9/7/16.
//  Copyright © 2016 Joan Molinas. All rights reserved.
//

#import "Packaging.h"

@implementation Packaging {
    NSInteger _lastIndexOfPackage;
    NSMutableArray *_queue;
}

#pragma mark - Inits

- (instancetype)init {
    return [self initWithSizeOfPackages:1];
}

- (instancetype)initWithSizeOfPackages:(NSInteger)size {
    if (self = [super init]) {
        _sizeOfPackage = size;
        _queue = [NSMutableArray new];
        _lastIndexOfPackage = 0;
    }
    
    return self;
}

#pragma mark - Adders

- (void)addElement:(id)element {
    [_queue addObject:element];
    _lastIndexOfPackage++;
}

- (void)addElements:(NSArray *)elements {
    NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(_queue.count, elements.count)];
    [_queue insertObjects:elements atIndexes:indexes];
    _lastIndexOfPackage += elements.count;
}

#pragma mark - Removers

- (void)removeLastElement {
    [_queue removeLastObject];
}

#pragma mark - Getters

- (NSArray *)all {
    return [_queue copy];
}

- (NSArray *)getPackage {
    if (_lastIndexOfPackage < 1) {
        _lastIndexOfPackage = 0;
        return @[];
    }
    NSUInteger startRange, finalRange;
    
    if ([self lessThanSizeOfPackage]) {
        startRange = 0;
        finalRange = _lastIndexOfPackage;
    } else {
        startRange = _lastIndexOfPackage - self.sizeOfPackage;
        finalRange = self.sizeOfPackage;
    }
    
    NSRange range = NSMakeRange(startRange, finalRange);
    NSArray *arr = [_queue subarrayWithRange:range];
    _lastIndexOfPackage -= self.sizeOfPackage;
    return arr;
}

- (NSInteger)size {
    return _queue.count;
}

#pragma mark - Consultors

- (BOOL)isEmpty {
    return _queue.count == 0;
}

- (BOOL)lessThanSizeOfPackage {
    return _lastIndexOfPackage - self.sizeOfPackage < 0;
}

@end
