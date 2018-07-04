//
//  OrderedPriorityQueue.m
//  playgournd_objc
//
//  Created by Burbulet on 10/31/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "OrderedPriorityQueue.h"

@interface OrderedPriorityQueue ()
@property (nonatomic, copy) NSMutableArray *pq;
@end

@implementation OrderedPriorityQueue

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pq = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)insertVar:(id)key
{
    NSInteger i = [self.pq count] - 1;
    [self.pq addObject:key];
    
    while (i >= 0 && [self.pq[i] compare:key] > 0) {
        [self.pq replaceObjectAtIndex:i+1 withObject:self.pq[i]];
        i--;
    }
    
    [self.pq replaceObjectAtIndex:i+1 withObject:key];
}

- (void)insert:(id)key
{
    NSInteger i = [self.pq count] - 1;
    while (i >= 0 && [self.pq[i] compare:key] > 0) {
        i--;
    }
    [self.pq insertObject:key atIndex:i+1];
}

- (id)delMax
{
    NSInteger count = [self.pq count] - 1;
    id max = self.pq[count];
    [self.pq removeObjectAtIndex:count];
    return max;
}

- (void)print
{
    NSLog(@"%@", self.pq);
}

@end
