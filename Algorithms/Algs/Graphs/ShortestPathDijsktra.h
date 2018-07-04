//
//  ShortestPathDijsktra.h
//  playgournd_objc
//
//  Created by Burbulet on 11/10/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

/*
 edge weights can not be negative, cycles may be present
 Parallel edges and self-loops may be present
 
 E log V 
 */

@class DirectedEdgeWeightedGraph, DirectedEdge;

@interface ShortestPathDijsktra : NSObject

- (instancetype)initWithEdgeWeightedGraph:(DirectedEdgeWeightedGraph *)graph vertex:(NSUInteger)vertex;
- (BOOL)hasPathTo:(NSUInteger)vertex;
- (NSArray <DirectedEdge *> *)shortestPathTo:(NSUInteger)vertex;
- (CGFloat)distanceTo:(NSUInteger)vertex;

@end
