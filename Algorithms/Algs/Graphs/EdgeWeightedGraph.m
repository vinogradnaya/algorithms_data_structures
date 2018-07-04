//
//  EdgeWeightedGraph.m
//  playgournd_objc
//
//  Created by Burbulet on 11/7/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "EdgeWeightedGraph.h"
#import "Edge.h"

typedef NSMutableArray <NSMutableArray <Edge *> *> Vertices;

@interface EdgeWeightedGraph ()
@property (nonatomic, strong) Vertices *vertices;
@property (nonatomic, assign) NSUInteger numberOfEdges;
@end

@implementation EdgeWeightedGraph

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

- (void)addEdge:(Edge *)edge
{
    NSUInteger v = [edge either];
    NSUInteger w = [edge other:v];
    [self.vertices[v] addObject:edge];
    [self.vertices[w] addObject:edge];
    
    self.numberOfEdges++;
}

- (NSArray <Edge *> *)adjacent:(NSUInteger)v
{
    return [self.vertices[v] copy];
}

- (NSArray <Edge *> *)edges
{    
    NSMutableArray *edges = [NSMutableArray new];
    for (NSUInteger vertex = 0; vertex < self.numberOfVertices; vertex++) {
        for (Edge *edge in [self adjacent:vertex]) {
            if ([edge other:vertex] > vertex) {
                [edges addObject:edge];
            }
        }
    }
    return [edges copy];
}
@end

