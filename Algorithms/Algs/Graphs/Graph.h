//
//  Graph.h
//  playgournd_objc
//
//  Created by Burbulet on 11/4/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSArray<NSNumber *> AdjacentVertices;

@interface Graph : NSObject

- (instancetype)initWithNumberOfVertices:(NSUInteger)numberOfVertices;
- (NSUInteger)numberOfVertices;
- (NSUInteger)numberOfEdges;
- (void)addEdgeFrom:(NSUInteger)v to:(NSUInteger)w;
- (AdjacentVertices *)adjacent:(NSUInteger)v;


@end
