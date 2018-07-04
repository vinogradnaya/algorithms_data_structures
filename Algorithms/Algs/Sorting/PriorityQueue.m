//
//  PriorityQueue.m
//  playgournd_objc
//
//  Created by Burbulet on 10/31/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "PriorityQueue.h"

@interface PriorityQueue()
@property (nonatomic, copy) NSMutableArray *pq;
@end

@implementation PriorityQueue

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pq = [[NSMutableArray alloc] init];
        [_pq addObject:[NSObject new]]; // stub to fill the 0 intex to simplify calculation for sink and swip
    }
    return self;
}

- (void)insert:(id)key
{
    [self.pq addObject:key];
    [self swim:[self.pq count] - 1];
}

- (id)delMax
{
    id max = [self.pq objectAtIndex:1];
    
    NSInteger N = [self.pq count] - 1;
    [self.pq exchangeObjectAtIndex:1 withObjectAtIndex:N];
    [self.pq removeObjectAtIndex:N];
    [self sink:1];
    
    return max;
}

- (void)sink:(NSInteger)key
{
    NSInteger N = [self.pq count] - 1;
    while (key * 2 <= N) {
        NSInteger j = key * 2;
        if (j < N && [self.pq[j] compare:self.pq[j + 1]] < 0) {
            j++;
        }
        if ([self.pq[key] compare:self.pq[j]] > 0) {
            break;
        }
        [self.pq exchangeObjectAtIndex:key withObjectAtIndex:j];
        key = j;
    }
}

- (void)swim:(NSInteger)key
{
    while (key > 1 && [self.pq[key] compare:self.pq[key/2]] > 0) {
        [self.pq exchangeObjectAtIndex:key withObjectAtIndex:key/2];
        key /= 2;
    }
}

- (void)print
{
    NSLog(@"PQ = %@", self.pq);
    
    NSInteger N = [self.pq count];
    for (NSInteger i = 1; i < N; i++) {
        NSLog(@"%@", [self delMax]);
    }
}

/** HEAP SORT uses MAX PQ - at each iteration it removes max and places it at the end of the array, selecting the next max **/

- (NSArray *)heapSort:(NSArray *)toSort
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:[toSort count] + 1];
    [array addObject:[NSObject new]]; //for calculation
    [array addObjectsFromArray:[toSort copy]];

    NSInteger N = [array count] - 1;

    for (NSInteger key = N / 2; key >= 1 ; key--) {
        [self sink:array key:key count:N];
    }
    
    while (N > 1) {
        [array exchangeObjectAtIndex:1 withObjectAtIndex:N--];
        [self sink:array key:1 count:N];
    }
    
    return [array copy];
}

- (void)sink:(NSMutableArray *)array key:(NSInteger)key count:(NSInteger)count
{
    while (key * 2 <= count) {
        NSInteger j = key * 2;
        if (j < count && [array [j] compare:array[j+1]] < 0) {
            j++;
        }
        
        if ([array[key] compare:array[j]] > 0) {
            break;
        }
        
        [array exchangeObjectAtIndex:key withObjectAtIndex:j];
        key = j;
    }
}

@end
