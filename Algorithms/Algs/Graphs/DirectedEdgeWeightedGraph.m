//
//  DirectedEdgeWeightedGraph.m
//  playgournd_objc
//
//  Created by Burbulet on 11/10/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "DirectedEdgeWeightedGraph.h"
#import "DirectedEdge.h"

typedef NSMutableArray <NSMutableArray <DirectedEdge *> *> Vertices;

@interface DirectedEdgeWeightedGraph()
@property (nonatomic, strong) Vertices *vertices;
@property (nonatomic, assign) NSUInteger numberOfEdges;
@end

@implementation DirectedEdgeWeightedGraph

- (instancetype)initWithNumberOfVertices:(NSUInteger)numberOfVertices
{
    self = [super init];
    if (self) {
        NSMutableArray *vertices = [[NSMutableArray alloc] initWithCapacity:numberOfVertices];
        for (NSUInteger v = 0; v < numberOfVertices; v++) {
            NSMutableArray *adjacent = [[NSMutableArray alloc] init];
            [vertices addObject:adjacent];
        }
        _vertices = vertices;
    }
    return self;
}

- (NSUInteger)numberOfVertices
{
    return [self.vertices count];
}

- (NSUInteger)numberOfEdges
{
    return _numberOfEdges;
}

- (void)addEdge:(DirectedEdge *)edge
{
    NSUInteger v = [edge from];
    [self.vertices[v] addObject:edge];
    
    self.numberOfEdges++;
}

- (NSArray <DirectedEdge *> *)adjacent:(NSUInteger)v
{
    return [self.vertices[v] copy];
}

- (NSArray <DirectedEdge *> *)edges
{
    NSMutableArray *edges = [NSMutableArray new];
    for (NSUInteger vertex = 0; vertex < self.numberOfVertices; vertex++) {
        for (DirectedEdge *edge in [self adjacent:vertex]) {
                [edges addObject:edge];
        }
    }
    return [edges copy];
}

@end
