//
//  PriorityQueue.h
//  playgournd_objc
//
//  Created by Burbulet on 10/31/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

// this implementation uses heap = logN to insert, logN to delete max
@interface PriorityQueue : NSObject

- (void)insert:(id)key;
- (id)delMax;

- (void)print;

// N exchages + 2N compares to create heap, NlogN to create the sorted array with sink, in place, but usually slower, because it does not use adjacent indeces - a lot of cache misses.

// NOT!! stable - https://stackoverflow.com/questions/19336881/why-isnt-heapsort-stable
- (NSArray *)heapSort:(NSArray *)array;

@end
