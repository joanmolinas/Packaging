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
- (instancetype)initWithSizeOfPackages:(NSUInteger)size;

//Adders
- (void)addElement:(id)element;
- (void)addElements:(NSArray *)elements;

//Removers
- (void)removeLastElement;

//Getters
- (NSArray *)all;
- (NSArray *)getPackage;
- (NSInteger)size;

//Consultors
- (BOOL)lessThanSizeOfPackage;
- (BOOL)isEmpty;
@end
