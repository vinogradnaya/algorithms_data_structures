//
//  BreadthFirstSearch.h
//  playgournd_objc
//
//  Created by Burbulet on 11/5/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 used for:
 - Shortest Path and Minimum Spanning Tree for unweighted graph
 - Peer to Peer Networks (find neighbors)
 - social networks - degrees of separation (it is basically a path between 2 people - through which people they are connected)

 E + V
 */

@class Graph;

@interface BreadthFirstSearch : NSObject
- (instancetype)initWithGraph:(Graph *)graph vertex:(NSUInteger)vertex;
- (NSArray *)pathToVertex:(NSUInteger)vertex;
@end
