//
//  Fibonacci.m
//  playgournd_objc
//
//  Created by Burbulet on 11/8/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "Fibonacci.h"

@implementation Fibonacci

- (NSArray *)fibonacci:(NSUInteger)number
{
    NSMutableArray *sequence = [[NSMutableArray alloc] initWithCapacity:number];
    
    for (NSUInteger i = 0; i < number; i++) {
        [sequence addObject:[NSNumber numberWithInteger:[self fibonacciInternal:i]]];
    }
    
    return [sequence copy];
}

- (NSUInteger)fibonacciInternal:(NSUInteger)i
{
    if (i <= 1) {
        return i;
    }
    return [self fibonacciInternal:i-1] + [self fibonacciInternal:i-2];
}

- (NSInteger)fibonacciRecursive:(NSInteger)fibMe{
    return (fibMe <= 1) ? fibMe : [self fibonacciRecursive:fibMe-1] + [self fibonacciRecursive:fibMe-2];
}

- (NSArray *)fibonacciIter:(NSUInteger)number
{
    NSMutableArray *sequence = [[NSMutableArray alloc] initWithCapacity:number];
    
    for (NSUInteger i = 0; i < number; i++) {
        if (i <= 1) {
            [sequence addObject:@(i)];
            continue;
        }
        NSUInteger value = [sequence[i - 1] integerValue] + [sequence[i - 2] integerValue];
        [sequence addObject:@(value)];
    }
    return [sequence copy];
}
@end
