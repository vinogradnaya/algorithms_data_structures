//
//  InsertionSort.m
//  playgournd_objc
//
//  Created by Burbulet on 10/27/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "InsertionSort.h"

@implementation InsertionSort

- (NSArray *)sort:(NSArray *)toSort
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[toSort copy]];
    NSInteger N = [array count];
    for(NSInteger i = 1; i < N; i++) {
        for(NSInteger j = i; j > 0 && [array[j-1] compare:array[j]] > 0; j--) {
//            [self exchange:j with:j-1 inArray:array];
            [array exchangeObjectAtIndex:j withObjectAtIndex:j-1];
        }
    }
    
    return [array copy];
}

- (NSArray *)sortNoExchange:(NSArray *)toSort
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[toSort copy]];
    for (NSInteger i = 1; i < [array count]; i++) {
        NSString *v = array[i];
        NSInteger j = i;
        while (j > 0 && [v compare:array[j-1]] < 0) {
            [array replaceObjectAtIndex:j withObject:array[j-1]];
            j--;
        }
        [array replaceObjectAtIndex:j withObject:v];
    }
    return [array copy];
}

- (void)moveZerosToEnd
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@1, @0, @0, @0, @1, @2, @0, @0]];
    
    NSInteger prev = [array count] - 1;
    for (NSInteger i = prev; i >= 0; i--) {
        if ([array[i] integerValue] != 0) {
            continue;
        }
        if (prev != i) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:prev];
//            [self exchange:i with:prev inArray:array];
        }
        prev--;
    }
    
    NSLog(@"sorted array = %@", array);
}

- (void)moveZerosToBeginning
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@1, @0, @0, @0, @1, @2, @0, @0]];
    for (NSInteger i = 0, prev = 0; i < [array count]; i++) {
        if ([array[i] integerValue] != 0) {
            continue;
        }
        if (prev != i) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:prev];
//            [self exchange:i with:prev inArray:array];
        }
        prev++;
    }
    
    NSLog(@"sorted array = %@", array);
}

- (void)moveZerosVariant {
    NSArray *toSort = @[@0, @1, @0, @0, @1, @2, @0, @0];
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[toSort copy]];
    for (NSInteger i = 1; i < [array count]; i++) {
        if ([array[i] integerValue] == 0) {
            //            NSNumber *v = array[i];
            NSInteger j = i;
            while (j > 0 && [array[j-1] integerValue] != 0) {
                //                [array replaceObjectAtIndex:j withObject:array[j-1]];
                j--;
            }
            //            [array replaceObjectAtIndex:j withObject:v];
//            [self exchange:i with:j inArray:array];
            [array exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
    }
    NSLog(@"sorted array = %@", array);
}



//- (void)exchange:(NSInteger)first with:(NSInteger)second inArray:(NSMutableArray *)array
//{
//    id temp = array[first];
//    array[first] = array[second];
//    array[second] = temp;
//}

@end
