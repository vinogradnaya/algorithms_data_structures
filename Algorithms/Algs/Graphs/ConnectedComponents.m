//
//  ConnectedComponents.m
//  playgournd_objc
//
//  Created by Burbulet on 11/5/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "ConnectedComponents.h"
#import "Graph.h"

@interface ConnectedComponents ()
@property (nonatomic, strong) Graph *graph;
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, strong) NSMutableArray <NSNumber *> *marked;
@property (nonatomic, strong) NSMutableArray <NSNumber *> *components;
@end

@implementation ConnectedComponents

- (instancetype)initWithGraph:(Graph *)graph
{
    self = [super init];
    if (self) {
        _graph = graph;
        
        NSUInteger numberOfVertices = [self.graph numberOfVertices];
        NSMutableArray *marked = [[NSMutableArray alloc] initWithCapacity:numberOfVertices];
        NSMutableArray *components = [[NSMutableArray alloc] initWithCapacity:numberOfVertices];
        for (NSUInteger i = 0; i < numberOfVertices; i++) {
            marked[i] = @0;
            components[i] = [NSNull null];
        }
        _marked = marked;
        _components = components;

        [self connect];
    }
    return self;
}

- (void)connect
{
    for (NSUInteger v = 0; v < self.graph.numberOfVertices; v++) {
        if ([self.marked[v] isEqual:@(0)]) {
            [self dfs:v];
            self.count++;
        }
    }
}

- (void)dfs:(NSUInteger)vertex
{
    [self.marked replaceObjectAtIndex:vertex withObject:@1];
    [self.components replaceObjectAtIndex:vertex withObject:@(self.count)];
    
    for (NSNumber *w in [self.graph adjacent:vertex]) {
        NSUInteger wInt = [w integerValue];
        if ([self.marked[wInt] isEqual:@(0)]) {
            [self dfs:wInt];
        }
    }
}


- (BOOL)isVertex:(NSUInteger)v connectedToVertex:(NSUInteger)w
{
    return [self.components[v] isEqual:self.components[w]];
}

- (NSUInteger)count
{
    return _count;
}

- (NSUInteger)componentOf:(NSUInteger)vertex
{
    return [self.components[vertex] integerValue];
}

@end
