//
//  DepthFirstSearch.h
//  playgournd_objc
//
//  Created by Burbulet on 11/4/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 used for:
 - cycle detection in DAGs
 - in garbage collection - all vertices that are not marked are subject to removal from memory
 - find path maze
 - does path exist
 - connected components
 - strongly connected components in Digraph (NOT acyclic) - Two vertices v and w are strongly connected if they are mutually reachable: that is, if there is a directed path from v to w and a directed path from w to v. A digraph is strongly connected if all its vertices are strongly connected to one another. We use Kosaraju algo to find strongly connected components
 
 - is bipartite?
 
 E + V
 */
@class Graph, DirectedEdgeWeightedGraph;

@interface DepthFirstSearch : NSObject

- (instancetype)initWithGraph:(Graph *)graph vertex:(NSUInteger)vertex;
- (instancetype)initWithDigraph:(DirectedEdgeWeightedGraph *)graph vertex:(NSUInteger)vertex;

// strongly connected components do have cycles, and we do apply reverse post order traversal to depect strongly connected components.
- (NSArray *)pathToVertex:(NSUInteger)vertex;
- (NSArray *)preOrderTraversal;
- (NSArray *)postOrderTraversal;

// these only work for directed acyclic graphs, so we check for a cycle beforehand.
- (NSArray *)topologicalOrder;
@end
