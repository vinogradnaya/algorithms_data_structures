//
//  ShortestPathDijsktra.m
//  playgournd_objc
//
//  Created by Burbulet on 11/10/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "ShortestPathDijsktra.h"
#import "DirectedEdge.h"
#import "DirectedEdgeWeightedGraph.h"
#import "IndexMinPQ.h"

@interface ShortestPathDijsktra()
@property (nonatomic, strong) NSMutableArray *distTo;
@property (nonatomic, strong) NSMutableArray *edgeTo;
@property (nonatomic, strong) IndexMinPQ *pq;
@end

@implementation ShortestPathDijsktra

- (instancetype)initWithEdgeWeightedGraph:(DirectedEdgeWeightedGraph *)graph vertex:(NSUInteger)vertex
{
    self = [super init];
    if (self) {
        NSMutableArray *distTo = [[NSMutableArray alloc] initWithCapacity:[graph numberOfVertices]];
        NSMutableArray *edgeTo = [[NSMutableArray alloc] initWithCapacity:[graph numberOfVertices]];
        for (NSUInteger i = 0; i < [graph numberOfVertices]; i++) {
            distTo[i] = @(CGFLOAT_MAX);
            edgeTo[i] = [NSNull null];
        }
        _edgeTo = edgeTo;
        _distTo = distTo;
        _pq = [[IndexMinPQ alloc] initWithNumberOfKeys:[graph numberOfVertices]];

        [self calculateShortestPathsInGraph:graph root:vertex];
    }
    return self;
}

- (void)calculateShortestPathsInGraph:(DirectedEdgeWeightedGraph *)graph root:(NSUInteger)vertex
{
    [self.pq insertKey:@(0) forIndex:vertex];
    self.distTo[vertex] = @(0.f);
    
    while (![self.pq isEmpty]) {
        NSUInteger min = [self.pq deleteMinKey];
        [self relax:graph root:min];
    }
}

- (void)relax:(DirectedEdgeWeightedGraph *)graph root:(NSUInteger)vertex
{
    for (DirectedEdge *edge in [graph adjacent:vertex]) {
        NSUInteger v = [edge from];
        NSUInteger w = [edge to];
        
        CGFloat currentMinDist = [self.distTo[w] floatValue];
        CGFloat newDist = [self.distTo[v] floatValue] + [edge weight];
        
        if (newDist < currentMinDist) {
            self.distTo[w] = @(newDist);
            self.edgeTo[w] = edge;
            if ([self.pq containsIndex:w]) {
                [self.pq changeKey:self.distTo[w] forIndex:w];
            } else {
                [self.pq insertKey:self.distTo[w] forIndex:w];
            }
        }
    }
}

- (BOOL)hasPathTo:(NSUInteger)vertex
{
    return [self.distTo[vertex] compare:@(CGFLOAT_MAX)] == NSOrderedAscending;
}

- (NSArray <DirectedEdge *> *)shortestPathTo:(NSUInteger)vertex
{
    NSMutableArray *sp = [[NSMutableArray alloc] init];
    
    id v = self.edgeTo[vertex];
    
    while (![v isKindOfClass:[NSNull class]]) {
        [sp addObject:v];
        v = self.edgeTo[[((DirectedEdge *) v) from]];
    }
    return [sp copy];
}

- (CGFloat)distanceTo:(NSUInteger)vertex
{
    return [self.distTo[vertex] floatValue];
}

@end
