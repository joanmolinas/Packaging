//
//  Packaging.h
//  Packaging
//
//  Created by Joan Molinas Ramon on 9/7/16.
//  Copyright © 2016 Joan Molinas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Packaging : NSObject

@property (nonatomic, assign) NSUInteger sizeOfPackage;

//Inits

/**
 Create a new Packaging instace.
 
 @param size size of package
 */
- (instancetype)initWithSizeOfPackages:(NSUInteger)size;

//Adders
/**
 Add element to packaging.
 
 @param element to add
 
 @discussion: The basic idea is work as a queue. First message will be older than the second message.
 The difference with queue is when get package, queue only get the first element starting from the beginning, Packaging get n elements starting to the last.
 
 */
- (void)addElement:(id)element;

/**
 Add and array to packaging
 
 @param elements array.
 */

- (void)addElements:(NSArray *)elements;

//Removers
/**
 Remove last element
 
 */
- (void)removeLastElement;

//Getters
/**
 All elements addded to packaging.
 @return all elements
 
 */

- (NSArray *)all;

/**
 Get a new package with n (sizeOfPackage) elements
 
 @discussion if the elements to get is greater than sizeOfPackage, will return
 sizeOfPackage elements. If it's less thas sizeOfPackage, will return the remaining elements.
 
 @return n elements
 
 */

- (NSArray *)getPackage;

/**
 Get number of elements in packaging.
 
 @return number of elements.
 
 */

- (NSInteger)size;

//Consultors

/**
 Return if next package will contain less than sizeOfPackage elements
 
 @return [[self getPackage] count] < sizeOfPackage
 
 */

- (BOOL)lessThanSizeOfPackage;

//Consultors

/**
 
 @return [self size] == 0; 
 
 */

- (BOOL)isEmpty;
@end
