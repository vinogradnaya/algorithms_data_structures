//
//  DirectedCycleDetector.h
//  playgournd_objc
//
//  Created by Burbulet on 11/11/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DirectedEdgeWeightedGraph, DirectedEdge;

@interface DirectedCycleDetector : NSObject
- (instancetype)initWithDigraph:(DirectedEdgeWeightedGraph *)graph vertex:(NSUInteger)vertex;
- (BOOL)hasCycle;
- (NSArray <DirectedEdge *> *)cycle;
@end
