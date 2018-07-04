//
//  Edge.m
//  playgournd_objc
//
//  Created by Burbulet on 11/7/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "Edge.h"

@interface Edge ()
@property (nonatomic, assign) NSUInteger v;
@property (nonatomic, assign) NSUInteger w;
@property (nonatomic, assign) CGFloat weight;
@end

@implementation Edge

- (instancetype) initWithVertice:(NSUInteger)v vertice:(NSUInteger)w weight:(CGFloat)weight
{
    self = [super init];
    if (self) {
        _v = v;
        _w = w;
        _weight = weight;
    }
    return self;
}

- (NSUInteger)either
{
    return self.v;
}

- (NSUInteger)other:(NSUInteger)v
{
    if (v == self.v) {
        return self.w;
    }
    
    if (v == self.w) return self.v;
    
    NSAssert(false, @"invalid vertice = %li", v);
    return -1;
}

- (CGFloat)weight
{
    return _weight;
}

- (NSComparisonResult)compare:(Edge *)that
{
    if (self.weight < that.weight) return NSOrderedAscending;
    else if (self.weight > that.weight) return NSOrderedDescending;
    else return NSOrderedSame;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%li - %li, %.2f", self.v, self.w, self.weight];
}

@end
