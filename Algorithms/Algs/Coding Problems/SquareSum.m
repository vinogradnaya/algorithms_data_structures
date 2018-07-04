//
//  SquareSum.m
//  playgournd_objc
//
//  Created by Burbulet on 11/19/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "SquareSum.h"

@interface SquareSum()
@property (nonatomic, strong) NSMutableArray <NSMutableArray *> *visited;
@end

@implementation SquareSum

- (NSUInteger)minSquaresToCutPaperOfWidth:(NSUInteger)width height:(NSUInteger)height
{
    self.visited = [NSMutableArray new];
    for (NSUInteger i = 0; i <= width; i++) {
        NSMutableArray *array = [NSMutableArray new];
        for (NSUInteger j = 0; j <= height; j++) {
            array[j] = [NSNull null];
        }
        self.visited[i] = array;
    }
    
    return [self calcMinSquaresToCutPaperOfWidth:width height:height];
}

- (NSUInteger)calcMinSquaresToCutPaperOfWidth:(NSUInteger)width height:(NSUInteger)height
{
    NSLog(@"calc width = %li, height = %li", width, height);
    if (width == height) {
        return 1;
    }
    
    if (![self.visited[width][height] isKindOfClass:[NSNull class]]) {
        return [self.visited[width][height] integerValue];
    }
    
    NSUInteger vertical_min = NSUIntegerMax;
    NSUInteger horizontal_min = NSUIntegerMax;
    
    for (NSUInteger i = 1; i <= width / 2; i++) {
        horizontal_min = MIN([self calcMinSquaresToCutPaperOfWidth:i height:height] + [self calcMinSquaresToCutPaperOfWidth:width - i height:height], horizontal_min);
    }
    
    for (NSUInteger i = 1; i <= height / 2; i++) {
        vertical_min = MIN([self calcMinSquaresToCutPaperOfWidth:width height:i] + [self calcMinSquaresToCutPaperOfWidth:width height:height - i], vertical_min);
    }
    
    
    [self.visited[width] replaceObjectAtIndex:height withObject:@(MIN(horizontal_min, vertical_min))];
    
    NSUInteger res = [self.visited[width][height] integerValue];
    
    return res;
}
@end
