//
//  Graph.m
//  playgournd_objc
//
//  Created by Burbulet on 11/4/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "Graph.h"

typedef NSMutableArray <NSMutableArray <NSNumber *> *> Vertices;

@interface Graph ()
@property (nonatomic, strong) Vertices *vertices;
@property (nonatomic, assign) NSUInteger numberOfEdges;
@end

@implementation Graph

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

- (void)addEdgeFrom:(NSUInteger)v to:(NSUInteger)w
{
    [self.vertices[v] addObject:@(w)];
    
// IN DIRECTED ACYCLIC GRAPH WE DO NOT ADD BACKWARD EDGE
//    [self.vertices[w] addObject:@(v)];
    self.numberOfEdges++;
}

- (Vertices *)adjacent:(NSUInteger)v
{
    return [self.vertices[v] copy];
}

@end
