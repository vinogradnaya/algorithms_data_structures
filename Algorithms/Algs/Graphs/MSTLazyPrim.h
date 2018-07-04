//
//  MSTLazyPrim.h
//  playgournd_objc
//
//  Created by Burbulet on 11/7/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EdgeWeightedGraph, Edge;


/*
 to compute MST, we have the following assumptions:
 - The graph is connected
 - The edge weights are not necessarily distances
 - The edge weights may be zero or negative
 - The edge weights are all different. In case it's not true - the MST may not be unique
 
 E log E
 
 - analoguous to BFS, but instead of simple queue it uses priority queue to get the next element
 */


@interface MSTLazyPrim : NSObject
- (instancetype)initWithEdgeWeightedGraph:(EdgeWeightedGraph *)graph;
- (NSArray<Edge *> *)minimalSpanningTree;
@end
