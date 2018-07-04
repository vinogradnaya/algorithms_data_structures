//
//  DirectedEdgeWeightedGraph.h
//  playgournd_objc
//
//  Created by Burbulet on 11/10/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DirectedEdge;

@interface DirectedEdgeWeightedGraph : NSObject
- (instancetype)initWithNumberOfVertices:(NSUInteger)numberOfVertices;
- (NSUInteger)numberOfVertices;
- (NSUInteger)numberOfEdges;
- (void)addEdge:(DirectedEdge *)edge;
- (NSArray <DirectedEdge *> *)adjacent:(NSUInteger)v;
- (NSArray <DirectedEdge *> *)edges;

@end
