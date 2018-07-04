//
//  MSTKruskal.h
//  playgournd_objc
//
//  Created by Burbulet on 11/7/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 E log E
 */

@class EdgeWeightedGraph, Edge;

@interface MSTKruskal : NSObject
- (instancetype)initWithEdgeWeightedGraph:(EdgeWeightedGraph *)graph;
- (NSArray<Edge *> *)minimalSpanningTree;
@end
