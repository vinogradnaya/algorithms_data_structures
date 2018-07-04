//
//  Edge.h
//  playgournd_objc
//
//  Created by Burbulet on 11/7/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface Edge : NSObject
- (instancetype) initWithVertice:(NSUInteger)v vertice:(NSUInteger)w weight:(CGFloat)weight;
- (NSUInteger)either;
- (NSUInteger)other:(NSUInteger)v;
- (CGFloat)weight;
- (NSComparisonResult)compare:(Edge *)other;
@end
