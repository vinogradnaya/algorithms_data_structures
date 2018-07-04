//
//  IndexMinPQ.m
//  playgournd_objc
//
//  Created by Burbulet on 11/10/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "IndexMinPQ.h"

/*
 pq contains integers in priority order, so pq[2] = for example vertex 3
 qp contains indeces in dif order, in qp[3] = 2 (index of vertex 3 in pq)
 keys[3] = key (for example weight) of vertex 3 which is in position 2 in pq
 */

@interface IndexMinPQ ()
@property (nonatomic, strong) NSMutableArray <NSNumber *> *pq;
@property (nonatomic, strong) NSMutableArray *qp;
@property (nonatomic, strong) NSMutableArray *keys;
@end

@implementation IndexMinPQ

- (instancetype)initWithNumberOfKeys:(NSUInteger)count
{
    self = [super init];
    if (self) {
        NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:count];
        for (NSUInteger i = 0; i < count; i++) {
            [keys addObject:[NSNull null]];
        }
        _keys = keys;
        _qp = [[NSMutableArray alloc] initWithArray:keys];
        
        NSMutableArray *pq = [[NSMutableArray alloc] initWithCapacity:count + 1];
        [pq addObject:[NSNull null]]; // place dummy object to be 0
        _pq = pq;
    }
    return self;
}

- (void)insertKey:(id)key forIndex:(NSUInteger)index
{
    NSUInteger n = [self.pq count];
    
    [self.pq addObject:@(index)];
    [self.qp replaceObjectAtIndex:index withObject:@(n)];
    [self.keys replaceObjectAtIndex:index withObject:key];
    
    [self swim:n];
}

- (NSUInteger)deleteMinKey
{
    NSUInteger min = [self.pq[1] integerValue];
    
    NSNumber *last = [self.pq lastObject];
    [self.pq replaceObjectAtIndex:1 withObject:last];
    [self.pq removeLastObject];
    
    [self.keys replaceObjectAtIndex:min withObject:[NSNull null]];
    [self.qp replaceObjectAtIndex:min withObject:[NSNull null]];
    
    [self sink:1];
    
    return min;
}

- (void)changeKey:(id)key forIndex:(NSUInteger)index
{
    [self.keys replaceObjectAtIndex:index withObject:key];
    [self swim:[self.qp[index] integerValue]];
    [self sink:[self.qp[index] integerValue]];
}

- (BOOL)containsIndex:(NSUInteger)index
{
    return ![self.keys[index] isKindOfClass:[NSNull class]];
}

- (BOOL)isEmpty
{
    return [self.pq count] <= 1;
}

- (void)sink:(NSInteger)key
{
    NSInteger N = [self.pq count] - 1;
    while (key * 2 <= N) {
        NSInteger j = key * 2;
        if (j < N && [self compare:self.pq[j] with:self.pq[j + 1]] == NSOrderedDescending) {
            j++;
        }
        if ([self compare:self.pq[key] with:self.pq[j]] == NSOrderedAscending) {
            break;
        }
        
        [self exchange:key with:j];
        
        key = j;
    }
}

- (void)swim:(NSInteger)key
{
    while (key > 1 && [self compare:self.pq[key] with:self.pq[key/2]] == NSOrderedAscending) {
        [self exchange:key with:key/2];
        key /= 2;
    }
}

- (NSComparisonResult)compare:(NSNumber *)i with:(NSNumber *)j
{
    return [self.keys[[i integerValue]] compare:self.keys[[j integerValue]]];
}

- (void)exchange:(NSUInteger)i with:(NSUInteger)j
{
    /*
     for example:
     key = 2
     j = 4
     
     v = pq[2] = 3 (vertex v)
     w = pq[4] = 5 (vertex w)
     
     qp[3] = 2 (position key in pq)
     qp[5] = 4 (position j in pq)
     
     [self.pq exchangeObjectAtIndex:key withObjectAtIndex:j];
     pq[2] = 5
     pq[4] = 3
     
     [self.qp exchangeObjectAtIndex:v withObjectAtIndex:w];
     qp[3] = 4
     qp[5] = 2;
     
     */

    NSUInteger v = [self.pq[i] integerValue];
    NSUInteger w = [self.pq[j] integerValue];
    
    [self.pq exchangeObjectAtIndex:i withObjectAtIndex:j];
    [self.qp exchangeObjectAtIndex:v withObjectAtIndex:w];
}

@end
