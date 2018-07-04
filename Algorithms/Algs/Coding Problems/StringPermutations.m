//
//  StringPermutations.m
//  playgournd_objc
//
//  Created by Burbulet on 11/20/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "StringPermutations.h"

@implementation StringPermutations
- (NSArray <NSString *> *)permutations:(NSString *)string
{
    NSLog(@"permutations string = %@", string);
    
    if (string == nil) {
        return nil;
    }
    
    NSMutableArray *permutations = [NSMutableArray new];

    if ([string length] == 0) {
        [permutations addObject:@""];
        return [permutations copy];
    }
    
    NSString *first = [string substringToIndex:1];
    NSString *remainder = [string substringFromIndex:1];
    
    NSLog(@"permutations first = %@", first);
    NSLog(@"permutations remainder = %@", remainder);

    NSArray <NSString *> *words = [self permutations:remainder];
    
    for (NSString *word in words) {
        NSLog(@"permutations word = %@", word);
        for (NSUInteger j = 0; j <= [word length]; j++) {
            NSLog(@"permutations word = %@, j = %li, first = %@", word, j, first);
            [permutations addObject:[self insertChar:first atIndex:j inString:word]];
        }
    }
    
    return [permutations copy];
    
}

- (NSString *)insertChar:(NSString *)c atIndex:(NSUInteger)index inString:(NSString *)word
{
    NSString *start = [word substringToIndex:index];
    NSString *end = [word substringFromIndex:index];
    NSLog(@"start = %@, end = %@, char = %@", start, end, c);

    NSString *newString = [NSString stringWithFormat:@"%@%@%@", start, c, end];
    NSLog(@"new string = %@", newString);
    return newString;
}
@end
