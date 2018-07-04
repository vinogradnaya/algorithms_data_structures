//
//  MinPQ.m
//  playgournd_objc
//
//  Created by Burbulet on 11/7/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "MinPQ.h"

@interface MinPQ()
@property (nonatomic, copy) NSMutableArray *pq;
@end

@implementation MinPQ

- (instancetype)init
{
    return [self initWithArray:nil];
}

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        _pq = [[NSMutableArray alloc] init];
        [_pq addObject:[NSObject new]]; // stub to fill the 0 intex to simplify calculation for sink and swip
        if (array != nil) {
            for (id object in array) {
                [self insert:object];
            }
        }
    }
    return self;
}

- (void)insert:(id)key
{
    [self.pq addObject:key];
    [self swim:[self.pq count] - 1];
}

- (id)delMin
{
    id min = [self.pq objectAtIndex:1];
    
    NSInteger N = [self.pq count] - 1;
    [self.pq exchangeObjectAtIndex:1 withObjectAtIndex:N];
    [self.pq removeObjectAtIndex:N];
    [self sink:1];
    
    return min;
}

- (void)sink:(NSInteger)key
{
    NSInteger N = [self.pq count] - 1;
    while (key * 2 <= N) {
        NSInteger j = key * 2;
        if (j < N && [self.pq[j] compare:self.pq[j + 1]] == NSOrderedDescending) {
            j++;
        }
        if ([self.pq[key] compare:self.pq[j]] == NSOrderedAscending) {
            break;
        }
        [self.pq exchangeObjectAtIndex:key withObjectAtIndex:j];
        key = j;
    }
}

- (void)swim:(NSInteger)key
{
    while (key > 1 && [self.pq[key] compare:self.pq[key/2]] == NSOrderedAscending) {
        [self.pq exchangeObjectAtIndex:key withObjectAtIndex:key/2];
        key /= 2;
    }
}

- (BOOL)isEmpty
{
    // we insert dummy object
    return [self.pq count] == 1;
}

@end
