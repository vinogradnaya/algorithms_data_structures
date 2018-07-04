//
//  DirectedEdge.h
//  playgournd_objc
//
//  Created by Burbulet on 11/10/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface DirectedEdge : NSObject
- (instancetype) initWithFrom:(NSUInteger)from to:(NSUInteger)to weight:(CGFloat)weight;
- (NSUInteger)from;
- (NSUInteger)to;
- (CGFloat)weight;
- (NSComparisonResult)compare:(DirectedEdge *)other;

@end
