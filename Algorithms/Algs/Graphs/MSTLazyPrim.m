//
//  MSTLazyPrim.m
//  playgournd_objc
//
//  Created by Burbulet on 11/7/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "MSTLazyPrim.h"
#import "EdgeWeightedGraph.h"
#import "Edge.h"
#import "MinPQ.h"

@interface MSTLazyPrim ()
@property (nonatomic, strong) NSMutableArray <NSNumber *> *marked;
@property (nonatomic, strong) NSMutableArray <Edge *> *mst;
@property (nonatomic, strong) MinPQ *pq;
@property (nonatomic, strong) EdgeWeightedGraph *graph;
@end

@implementation MSTLazyPrim
- (instancetype)initWithEdgeWeightedGraph:(EdgeWeightedGraph *)graph
{
    self = [super init];
    if (self) {
        NSMutableArray *marked = [[NSMutableArray alloc] initWithCapacity:[graph numberOfVertices]];
        for (NSInteger i = 0; i < [graph numberOfVertices]; i++) {
            [marked addObject:@0];
        }
        _marked = marked;
        _graph = graph;
        _pq = [[MinPQ alloc] init];
        _mst = [NSMutableArray new];
        [self calculateMST];
    }
    return self;
}

- (void)calculateMST
{
    [self visit:0];
    
    while (![self.pq isEmpty]) {
        Edge *edge = [self.pq delMin];
        NSUInteger v = [edge either];
        NSUInteger w = [edge other:v];
        
        if ([self isMarked:v] && [self isMarked:w]) {
            continue;
        }
        
        [self.mst addObject:edge];
        
        if (![self isMarked:v]) {
            [self visit:v];
        }
        if (![self isMarked:w]) {
            [self visit:w];
        }
    }
}

- (void)visit:(NSUInteger)v
{
    self.marked[v] = @1;
    for (Edge *edge in [self.graph adjacent:v]) {
        NSUInteger w = [edge other:v];
        if (![self isMarked:w]) {
            [self.pq insert:edge];
        }
    }
}

- (NSArray<Edge *> *)minimalSpanningTree
{
    return [self.mst copy];
}

- (BOOL)isMarked:(NSUInteger)v
{
    return [self.marked[v] integerValue] > 0;
}

@end
