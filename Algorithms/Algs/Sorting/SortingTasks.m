//
//  SortingTasks.m
//  playgournd_objc
//
//  Created by Burbulet on 10/31/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "SortingTasks.h"
#import "QuickSort.h"

@implementation SortingTasks

- (NSArray *)findDistinctValues:(NSArray *)toSort
{
    QuickSort *quickSort = [QuickSort new];
    NSArray *sorted = [quickSort sort:toSort];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:sorted[0]]; // assume array count > 0
    
    for (NSInteger i = 1; i < [sorted count]; i++) {
        if ([sorted[i] compare:sorted[i-1]] != NSOrderedSame) {
            [array addObject:sorted[i]];
        }
    }
    
    return [array copy];
}



@end
