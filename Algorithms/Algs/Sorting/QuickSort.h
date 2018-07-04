//
//  QuickSort.h
//  playgournd_objc
//
//  Created by Burbulet on 10/29/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuickSort : NSObject
- (NSArray *)sort:(NSArray *)toSort;
- (NSArray *)sortDuplicateObjects:(NSArray *)toSort;
- (void) moveZerosToBeginning;
- (void)moveZerosToEnd;
- (id)findMedian:(NSArray *)toSort;
@end
