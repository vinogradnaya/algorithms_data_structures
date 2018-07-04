//
//  BreadthFirstSearch.m
//  playgournd_objc
//
//  Created by Burbulet on 11/5/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "BreadthFirstSearch.h"
#import "Graph.h"

@interface BreadthFirstSearch ()
@property (nonatomic, strong) Graph *graph;
@property (nonatomic, assign) NSUInteger vertex;
@property (nonatomic, strong) NSMutableArray <NSNumber *> *marked;
@property (nonatomic, strong) NSMutableArray <NSNumber *> *edges;
@end

@implementation BreadthFirstSearch

- (instancetype)initWithGraph:(Graph *)graph vertex:(NSUInteger)vertex
{
    self = [super init];
    if (self) {
        _graph = graph;
        _vertex = vertex;
        
        NSUInteger numberOfVertices = [self.graph numberOfVertices];
        NSMutableArray *marked = [[NSMutableArray alloc] initWithCapacity:numberOfVertices];
        NSMutableArray *edges = [[NSMutableArray alloc] initWithCapacity:numberOfVertices];
        for (NSUInteger i = 0; i < numberOfVertices; i++) {
            marked[i] = @0;
            edges[i] = [NSNull null];
        }
        _marked = marked;
        _edges = edges;
        
        [self bfs];
    }
    return self;
}

- (void)bfs
{
    NSMutableArray *queue = [[NSMutableArray alloc] init];
    [queue addObject:@(self.vertex)];

    self.marked[self.vertex] = @1;
    
    while ([queue count] > 0) {
        NSUInteger vertex = [[queue firstObject] integerValue];
        [queue removeObjectAtIndex:0];
        for (NSNumber *w in [self.graph adjacent:vertex]) {
            NSUInteger wInt = [w integerValue];
            if ([[self.marked objectAtIndex:wInt] isEqual:@(0)]) {
                self.edges[wInt] = @(vertex);
                self.marked[wInt] = @(1);
                [queue addObject:w];
            }
        }
    }
}

- (NSArray *)pathToVertex:(NSUInteger)vertex
{
    NSNumber *v = @(vertex);
    NSMutableArray *path = [[NSMutableArray alloc] init];
    while (![v isKindOfClass:[NSNull class]]) {
        [path addObject:v];
        v =  self.edges[[v integerValue]];
    }
    return [path copy];
}

@end
