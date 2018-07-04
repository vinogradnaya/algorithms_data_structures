//
//  QuickSort.m
//  playgournd_objc
//
//  Created by Burbulet on 10/29/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort

- (NSArray *)sort:(NSArray<NSString *> *)toSort
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[toSort copy]];
    [self shuffle:array];
    [self sort:array low:0 high:[array count] - 1];
    return [array copy];
}

- (void)sort:(NSMutableArray *)array low:(NSInteger)low high:(NSInteger)high
{
    if (low >= high) {
        return;
    }
    NSInteger j = [self partition:array low:low high:high];
    [self sort:array low:low high:j-1];
    [self sort:array low:j+1 high:high];
}

- (NSInteger)partition:(NSMutableArray *)array low:(NSUInteger)low high:(NSInteger)high
{
    id v = array[low];
    
    NSInteger i = low;
    NSInteger j = high + 1; // а че +1?
    
    while (true) {
        while ([array[++i] compare:v] < 0) {
            if (i == high) {
                break;
            }
        }
        while ([array[--j] compare:v] > 0) {
            if (j == low) {
                break;
            }
        }
        if (i >= j) {
            break;
        }
//        [self exchange:i with:j inArray:array];
        [array exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
//    [self exchange:low with:j inArray:array];
    [array exchangeObjectAtIndex:low withObjectAtIndex:j];
    
    return j;
}

- (NSArray *)sortDuplicateObjects:(NSArray *)toSort
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[toSort copy]];
    [self shuffle:array];
    [self sortD:array low:0 high:[array count] - 1];
    return [array copy];
}

- (void)sortD:(NSMutableArray *)array low:(NSInteger)low high:(NSInteger)high
{
    if (high <= low) {
        return;
    }
    
    NSInteger lt = low;
    NSInteger i = low + 1;
    NSInteger gt = high;
    
    id v = array[low];
    
    while (i <= gt) {
        NSInteger cmp = [array[i] compare:v];
        if (cmp < 0) {
//            [self exchange:i++ with:lt++ inArray:array];
            [array exchangeObjectAtIndex:i++ withObjectAtIndex:lt++];
        } else if (cmp > 0) {
//            [self exchange:i with:gt-- inArray:array];
            [array exchangeObjectAtIndex:i withObjectAtIndex:gt--];
        } else {
            i++;
        }
    }
    
    [self sortD:array low:low high:lt-1];
    [self sortD:array low:gt + 1 high:high];
}

- (void)shuffle:(NSMutableArray *)array
{
    NSUInteger count = [array count];
    if (count <= 1) return;
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [array exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

- (void)moveZerosToBeginning
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@1, @1, @1, @1, @0, @0, @0, @0]];
    
    NSInteger i = 0;
    NSInteger gt = [array count] - 1;

    while (i <= gt) {
        BOOL cmp = [array[i] integerValue] > 0;
        if (cmp) {
            // move greater than 0 to the right
//            [self exchange:i with:gt-- inArray:array];
            [array exchangeObjectAtIndex:i withObjectAtIndex:gt--];
        } else {
            i++;
        }
    }
    
    NSLog(@"sorted array = %@", array);
}

- (void)moveZerosToEnd
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@0, @0, @1, @1, @0, @0, @0, @0]];
    
    NSInteger i = [array count] - 1;
    NSInteger lt = 0;
    
    while (i >= lt) {
        BOOL cmp = [array[i] integerValue] > 0;
        if (cmp) {
            // move non-0 to the left
//            [self exchange:i with:lt++ inArray:array];
            [array exchangeObjectAtIndex:i withObjectAtIndex:lt++];
        } else {
            i--;
        }
    }
    
    NSLog(@"sorted array = %@", array);
}

- (void)moveZerosToBeginningVar
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@0, @1, @1, @1, @0, @0, @0, @1]];
    
    NSInteger i = 0;
    NSInteger lt = 0;
    
    while (i <= [array count] - 1) {
        BOOL cmp = [array[i] integerValue] == 0;
        if (cmp) {
            // move 0 to the left
//            [self exchange:i++ with:lt++ inArray:array];
            [array exchangeObjectAtIndex:i++ withObjectAtIndex:lt++];
        } else {
            i++;
        }
    }
    
    NSLog(@"sorted array = %@", array);
}

- (void)moveZerosToEndVar
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@0, @1, @1, @1, @0, @0, @0, @1]];
    
    NSInteger i = [array count] - 1;
    NSInteger lt = [array count] - 1;
    
    while (i >= 0) {
        BOOL cmp = [array[i] integerValue] == 0;
        if (cmp) {
            // move 0 to the left
//            [self exchange:i-- with:lt-- inArray:array];
            [array exchangeObjectAtIndex:i-- withObjectAtIndex:lt--];
        } else {
            i--;
        }
    }
    
    NSLog(@"sorted array = %@", array);
}

- (id)findMedian:(NSArray *)toSort
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[toSort copy]];
    [self shuffle:array];
    
    NSInteger low = 0;
    NSInteger high = [array count] - 1;
    NSInteger k = high / 2; // мы хотим найти какой значение элемента, который медиана - то есть находится точно посередине
    
    while (high > low) {
        NSInteger j = [self partition:array low:low high:high];
        if (j == k) {
            return array[k];
        } else if (j > k) {
            high = j - 1;
        } else if (j < k) {
            low = j + 1;
        }
    }
    
    return array[k];
}

//- (void)exchange:(NSInteger)first with:(NSInteger)second inArray:(NSMutableArray *)array
//{
//    id temp = array[first];
//    array[first] = array[second];
//    array[second] = temp;
//}


@end
