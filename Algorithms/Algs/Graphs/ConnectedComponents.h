//
//  ConnectedComponents.h
//  playgournd_objc
//
//  Created by Burbulet on 11/5/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Graph;

@interface ConnectedComponents : NSObject
- (instancetype)initWithGraph:(Graph *)graph;
- (BOOL)isVertex:(NSUInteger)v connectedToVertex:(NSUInteger)w;
- (NSUInteger)count;
- (NSUInteger)componentOf:(NSUInteger)vertex;
@end
