//
//  DirectedEdge.m
//  playgournd_objc
//
//  Created by Burbulet on 11/10/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "DirectedEdge.h"

@interface DirectedEdge()
@property (nonatomic, assign) NSUInteger from;
@property (nonatomic, assign) NSUInteger to;
@property (nonatomic, assign) CGFloat weight;
@end

@implementation DirectedEdge

- (instancetype) initWithFrom:(NSUInteger)from to:(NSUInteger)to weight:(CGFloat)weight
{
    self = [super init];
    if (self) {
        _from = from;
        _to = to;
        _weight = weight;
    }
    return self;
}

- (NSComparisonResult)compare:(DirectedEdge *)that
{
    if (self.weight < that.weight) return NSOrderedAscending;
    else if (self.weight > that.weight) return NSOrderedDescending;
    else return NSOrderedSame;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%li - %li, %.2f", self.from, self.to, self.weight];
}

@end
