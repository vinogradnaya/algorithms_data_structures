//
//  MSTKruskal.m
//  playgournd_objc
//
//  Created by Burbulet on 11/7/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "MSTKruskal.h"
#import "EdgeWeightedGraph.h"
#import "Edge.h"
#import "MinPQ.h"
#import "WeightedUnionFind.h"

@interface MSTKruskal()
@property (nonatomic, strong) NSMutableArray <Edge *> *mst;
@property (nonatomic, strong) MinPQ *pq;
@property (nonatomic, strong) EdgeWeightedGraph *graph;
@property (nonatomic, strong) WeightedUnionFind *uf;

@end

@implementation MSTKruskal

- (instancetype)initWithEdgeWeightedGraph:(EdgeWeightedGraph *)graph
{
    self = [super init];
    if (self) {
        _pq = [[MinPQ alloc] initWithArray:[graph edges]];
        _uf = [[WeightedUnionFind alloc] initWithNumberOfElements:[graph numberOfVertices]];
        _mst = [[NSMutableArray alloc] init];
        _graph = graph;
        [self createMST];
    }
    return self;
}

- (void)createMST
{
    while (![self.pq isEmpty] && [self.mst count] < [self.graph numberOfVertices] - 1) {
        Edge *edge = [self.pq delMin];
        NSUInteger v = [edge either];
        NSUInteger w = [edge other:v];
        if ([self.uf isConnected:v to:w]) {
            continue;
        }
        [self.uf unionOf:v with:w];
        [self.mst addObject:edge];
    }
}

- (NSArray<Edge *> *)minimalSpanningTree
{
    return [self.mst copy];
}

@end
