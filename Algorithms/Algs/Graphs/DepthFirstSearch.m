//
//  DepthFirstSearch.m
//  playgournd_objc
//
//  Created by Burbulet on 11/4/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "DepthFirstSearch.h"
#import "Graph.h"
#import "DirectedEdgeWeightedGraph.h"
#import "DirectedEdge.h"

@interface DepthFirstSearch ()
@property (nonatomic, strong) NSMutableArray <NSNumber *> *marked;
@property (nonatomic, strong) NSMutableArray <NSNumber *> *edges;
@property (nonatomic, strong) NSMutableArray <NSNumber *> *preOrder;
@property (nonatomic, strong) NSMutableArray <NSNumber *> *postOrder;
@property (nonatomic, strong) NSMutableArray <NSNumber *> *topological;
@end

@implementation DepthFirstSearch

- (instancetype)initWithGraph:(Graph *)graph vertex:(NSUInteger)vertex
{
    self = [super init];
    if (self) {
        NSUInteger numberOfVertices = [graph numberOfVertices];
        NSMutableArray *marked = [[NSMutableArray alloc] initWithCapacity:numberOfVertices];
        NSMutableArray *edges = [[NSMutableArray alloc] initWithCapacity:numberOfVertices];
        for (NSUInteger i = 0; i < numberOfVertices; i++) {
            marked[i] = @0;
            edges[i] = [NSNull null];
        }
        _marked = marked;
        _edges = edges;
        _preOrder = [NSMutableArray new];
        _postOrder = [NSMutableArray new];
        [self dfsInGraph:graph root:vertex];
    }
    return self;
}

- (instancetype)initWithDigraph:(DirectedEdgeWeightedGraph *)graph vertex:(NSUInteger)vertex
{
    self = [super init];
    if (self) {
        NSUInteger numberOfVertices = [graph numberOfVertices];
        NSMutableArray *marked = [[NSMutableArray alloc] initWithCapacity:numberOfVertices];
        NSMutableArray *edges = [[NSMutableArray alloc] initWithCapacity:numberOfVertices];
        for (NSUInteger i = 0; i < numberOfVertices; i++) {
            marked[i] = @0;
            edges[i] = [NSNull null];
        }
        _marked = marked;
        _edges = edges;
        _preOrder = [NSMutableArray new];
        _postOrder = [NSMutableArray new];
        [self dfsInDigraph:graph root:vertex];
    }
    return self;
}

- (void)dfsInGraph:(Graph *)graph root:(NSUInteger)vertex
{
    [self.marked replaceObjectAtIndex:vertex withObject:@1];
    
    // for preorder, add to queue before the object is processed
    // IS ONLY VALID FOR DIRECTED ACYCLIC GRAPH
    // it the way dfs is called
    [self.preOrder addObject:@(vertex)];
    
    //        onStack[v] = true; // to detect cycles in acyclic graph
    
    for (NSNumber *w in [graph adjacent:vertex]) {
        NSUInteger wInt = [w integerValue];
        if ([self.marked[wInt] isEqual:@(0)]) {
            // color[w] = !color[v]; // to support bipartite graph
            [self.edges replaceObjectAtIndex:wInt withObject:@(vertex)];
            [self dfsInGraph:graph root:wInt];
        } else {
            if (vertex != wInt) {
                // we have a cycle - because we are supposed to be going down the graph and we we meet a vertex that has already been marked, than we have a backward edge, which is a cycle
                NSLog(@"cycle detected");
            }
            // else if (color[w] == color[v]) isTwoColorable = false; // not bipartite graph
            
            /*
             // to detect cycles in Direcred Acyclic Graph
             else if (onStack[w])
             {
             cycle = new Stack<Integer>();
             for (int x = v; x != w; x = edgeTo[x])
             cycle.push(x);
             cycle.push(w);
             cycle.push(v);
             }
             */
        }
        //onStack[v] = false; // to detect cycles in Direcred Acyclic Graph
    }
    
    // for post order, add to queue after the object is processed
    // reverse post order is topological sort, i.e. the sort of dependencies - which object depends on which
    // IS ONLY VALID FOR DIRECTED ACYCLIC GRAPH
    [self.postOrder addObject:@(vertex)];
}

- (void)dfsInDigraph:(DirectedEdgeWeightedGraph *)graph root:(NSUInteger)vertex
{
    [self.marked replaceObjectAtIndex:vertex withObject:@1];
    
    // for preorder, add to queue before the object is processed
    // IS ONLY VALID FOR DIRECTED ACYCLIC GRAPH
    // it the way dfs is called
    [self.preOrder addObject:@(vertex)];
    
    //        onStack[v] = true; // to detect cycles in acyclic graph
    
    for (DirectedEdge *edge in [graph adjacent:vertex]) {
        NSUInteger w = [edge to];
        if ([self.marked[w] isEqual:@(0)]) {
            // color[w] = !color[v]; // to support bipartite graph
//            [self.edges replaceObjectAtIndex:w withObject:@(vertex)];
            [self dfsInDigraph:graph root:w];
        } else {
            /*
             // to detect cycles in Direcred Acyclic Graph
             else if (onStack[w])
             {
             cycle = new Stack<Integer>();
             for (int x = v; x != w; x = edgeTo[x])
             cycle.push(x);
             cycle.push(w);
             cycle.push(v);
             }
             */
        }
        //onStack[v] = false; // to detect cycles in Direcred Acyclic Graph
    }
    
    // for post order, add to queue after the object is processed
    // reverse post order is topological sort, i.e. the sort of dependencies - which object depends on which
    // IS ONLY VALID FOR DIRECTED ACYCLIC GRAPH
    [self.postOrder addObject:@(vertex)];
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

- (NSArray *)preOrderTraversal
{
    return [self.preOrder copy];
}

- (NSArray *)postOrderTraversal
{
    return [self.postOrder copy];
}

- (NSArray *)topologicalOrder
{
    return [self.topological copy];
}

- (NSMutableArray <NSNumber *> *)topological
{
    if (_topological != nil) {
        return _topological;
    }
    
    NSMutableArray *topological = [[NSMutableArray alloc] initWithArray:self.postOrder];
    
    NSUInteger i, j;
    
    for (i = 0, j = [topological count] - 1; i < j ; i++, j--) {
        [topological exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    
    _topological = topological;
    return _topological;

}

@end
