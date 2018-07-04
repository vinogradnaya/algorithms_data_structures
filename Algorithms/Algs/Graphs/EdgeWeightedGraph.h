//
//  EdgeWeightedGraph.h
//  playgournd_objc
//
//  Created by Burbulet on 11/7/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 UNDIRECTED - USED FOR MST
 - Parallel edges allowed
 - Self-loops allowed, but we omit them in implementation
 */

@class Edge;

@interface EdgeWeightedGraph : NSObject

- (instancetype)initWithNumberOfVertices:(NSUInteger)numberOfVertices;
- (NSUInteger)numberOfVertices;
- (NSUInteger)numberOfEdges;
- (void)addEdge:(Edge *)edge;
- (NSArray <Edge *> *)adjacent:(NSUInteger)v;
- (NSArray <Edge *> *)edges;
@end
