//
//  AcyclicShortestPath.h
//  playgournd_objc
//
//  Created by Burbulet on 11/11/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@class DirectedEdgeWeightedGraph, DirectedEdge;

@interface AcyclicShortestPath : NSObject
// this algo only works for directed acyclic weighted graph, it allows negative weights
- (instancetype)initWithDigraph:(DirectedEdgeWeightedGraph *)graph vertex:(NSUInteger)vertex NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
- (NSArray <DirectedEdge *> *)shortestPathTo:(NSUInteger)vertex;
- (BOOL)hasPathTo:(NSUInteger)vertex;
- (CGFloat)distanceTo:(NSUInteger)vertex;
@end
