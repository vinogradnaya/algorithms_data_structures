//
//  AcyclicLongestPath.m
//  playgournd_objc
//
//  Created by Burbulet on 11/11/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "AcyclicLongestPath.h"
#import "DirectedEdge.h"
#import "DirectedEdgeWeightedGraph.h"
#import "DepthFirstSearch.h"
#import "DirectedCycleDetector.h"

@interface AcyclicLongestPath()
@property (nonatomic, strong) NSMutableArray <DirectedEdge *> *edgeTo;
@property (nonatomic, strong) NSMutableArray <NSNumber *> *distTo;
@end

@implementation AcyclicLongestPath

- (instancetype)initWithDigraph:(DirectedEdgeWeightedGraph *)graph vertex:(NSUInteger)vertex
{
    self = [super init];
    if (self) {
        
        NSMutableArray *edges = [[NSMutableArray alloc] initWithCapacity:[graph numberOfVertices]];
        NSMutableArray *distances = [[NSMutableArray alloc] initWithCapacity:[graph numberOfVertices]];
        
        for (NSUInteger i = 0; i < [graph numberOfVertices]; i++) {
            [edges addObject:[NSNull null]];
            [distances addObject:@(CGFLOAT_MIN)];
        }
        _edgeTo = edges;
        _distTo = distances;
        
        DirectedCycleDetector *detector = [[DirectedCycleDetector alloc] initWithDigraph:graph vertex:vertex];
        if (![detector hasCycle]) {
            DepthFirstSearch *dfs = [[DepthFirstSearch alloc] initWithDigraph:graph vertex:vertex];
            NSArray <NSNumber *> *topological = [dfs topologicalOrder];
            
            self.distTo[vertex] = @0;
            
            for (NSNumber *v in topological) {
                [self relaxVertex:[v integerValue] inGraph:graph];
            }
        }
    }
    return self;
}

- (void)relaxVertex:(NSUInteger)vertex inGraph:(DirectedEdgeWeightedGraph *)graph
{
    for (DirectedEdge *edge in [graph adjacent:vertex]) {
        NSUInteger w = [edge to];
        NSUInteger v = [edge from];
        CGFloat currentMax = [self.distTo[w] floatValue];
        CGFloat candidateMax = [self.distTo[v] floatValue] + [edge weight];
        if (candidateMax > currentMax ) {
            self.distTo[w] = @(candidateMax);
            self.edgeTo[w] = edge;
        }
    }
}

- (BOOL)hasPathTo:(NSUInteger)vertex
{
    return [self.distTo[vertex] compare:@(CGFLOAT_MIN)] == NSOrderedDescending;
}

- (NSArray <DirectedEdge *> *)longestPathTo:(NSUInteger)vertex
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
