//
//  DirectedCycleDetector.m
//  playgournd_objc
//
//  Created by Burbulet on 11/11/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "DirectedCycleDetector.h"
#import "DirectedEdgeWeightedGraph.h"
#import "DirectedEdge.h"

@interface DirectedCycleDetector()
@property (nonatomic, strong) NSMutableArray <NSNumber *> *marked;
@property (nonatomic, strong) NSMutableArray <NSNumber *> *stack;
@property (nonatomic, strong) NSMutableArray <DirectedEdge *> *detectedCycle;
@property (nonatomic, strong) NSMutableArray <DirectedEdge *> *edges;
@end

@implementation DirectedCycleDetector
- (instancetype)initWithDigraph:(DirectedEdgeWeightedGraph *)graph vertex:(NSUInteger)vertex
{
    self = [super init];
    if (self) {
        NSUInteger numberOfVertices = [graph numberOfVertices];
        NSMutableArray *marked = [[NSMutableArray alloc] initWithCapacity:numberOfVertices];
        NSMutableArray *stack = [[NSMutableArray alloc] initWithCapacity:numberOfVertices];
        NSMutableArray *edges = [[NSMutableArray alloc] initWithCapacity:numberOfVertices];
        for (NSUInteger i = 0; i < numberOfVertices; i++) {
            [marked addObject:@0];
            [stack addObject:@0];
            [edges addObject:[NSNull null]];
//            marked[i] = @0;
//            stack[i] = @0;
//            edges[i] = [NSNull null];
        }
        _marked = marked;
        _stack = stack;
        _edges = edges;
        [self dfsInDigraph:graph root:vertex];
    }
    return self;
}

- (void)dfsInDigraph:(DirectedEdgeWeightedGraph *)graph root:(NSUInteger)vertex
{
    [self.marked replaceObjectAtIndex:vertex withObject:@1];
    
    [self.stack replaceObjectAtIndex:vertex withObject:@1];
    
    for (DirectedEdge *edge in [graph adjacent:vertex]) {
        NSUInteger w = [edge to];
        if ([self.marked[w] isEqual:@(0)]) {
            [self.edges replaceObjectAtIndex:w withObject:edge];
            [self dfsInDigraph:graph root:w];
        } else {
            if ([self.stack[w] isEqual:@1]) {
                
                // this should be stack rather that array
                self.detectedCycle = [NSMutableArray new];
                
                DirectedEdge *f = edge;
                while ([f from] != w) {
                    [self.detectedCycle addObject:f];
                    NSUInteger v = [f from];
                    f = self.edges[v];
                }
                [self.detectedCycle addObject:f];
            }
        }
    }
    
    [self.stack replaceObjectAtIndex:vertex withObject:@0];
}

- (BOOL)hasCycle
{
    return self.detectedCycle != nil;
}

- (NSArray <DirectedEdge *> *)cycle
{
    return [self.detectedCycle copy];
}

@end
