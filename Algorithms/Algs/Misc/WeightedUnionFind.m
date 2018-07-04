//
//  WeightedUnionFind.m
//  playgournd_objc
//
//  Created by Burbulet on 11/8/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "WeightedUnionFind.h"

@interface WeightedUnionFind()
@property (nonatomic, copy) NSMutableArray *sizes;
@property (nonatomic, copy) NSMutableArray *parents;
@property (nonatomic, assign) NSUInteger numberOfComponents;
@end

@implementation WeightedUnionFind
- (instancetype)initWithNumberOfElements:(NSUInteger)count
{
    self = [super init];
    if (self) {
        NSMutableArray *sizes = [[NSMutableArray alloc] initWithCapacity:count];
        NSMutableArray *parents = [[NSMutableArray alloc] initWithCapacity:count];
        
        for (NSUInteger i = 0; i < count; i++) {
            [parents addObject:@(i)];
            [sizes addObject:@1];
        }
        _sizes = sizes;
        _parents = parents;
        _numberOfComponents = count;
    }
    return self;
}

- (NSUInteger)findParent:(NSUInteger)p
{
    while (p != [self.parents[p] integerValue]) {
        p = [self.parents[p] integerValue];
    }
    
    return p;
}

- (void)unionOf:(NSUInteger)p with:(NSUInteger)q
{
    NSUInteger i = [self findParent:p];
    NSUInteger j = [self findParent:q];
    
    if (i == j) {
        return;
    }
    
    NSUInteger iSize = [self.sizes[i] integerValue];
    NSUInteger jSize = [self.sizes[j] integerValue];
    
    if (iSize < jSize) {
        [self.parents replaceObjectAtIndex:i withObject:@(j)];
        [self.sizes replaceObjectAtIndex:j withObject:@(jSize + iSize)];
    } else {
        [self.parents replaceObjectAtIndex:j withObject:@(i)];
        [self.sizes replaceObjectAtIndex:i withObject:@(jSize + iSize)];
    }
    self.numberOfComponents--;
}

- (BOOL)isConnected:(NSUInteger)p to:(NSUInteger)q
{
    NSUInteger i = [self findParent:p];
    NSUInteger j = [self findParent:q];
    return  i == j;
}

@end
