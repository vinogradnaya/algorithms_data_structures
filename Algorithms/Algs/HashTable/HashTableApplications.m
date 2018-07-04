//
//  SetIntersection.m
//  playgournd_objc
//
//  Created by Burbulet on 11/4/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "HashTableApplications.h"

@implementation HashTableApplications
- (NSSet *)intersection:(NSSet *)initialSet
{
    NSMutableSet *set = [NSMutableSet new];
    return set;
    
    /*
     If you have a hash set (O(1) lookup), then iterate across all the elements in the first set. If it's in the second set, then add it to the result. This runs in O(n) time.
     
     
     If you have a tree set (O(lg n) lookup), then this approach will work, but it runs in O(n lg n) time.
     You can do better; there's an O(n) solution:
     
     Iterate two sets in ascending order.
     At each step, compare the first elements of the ranges:
     If they're equal, add the element to the intersection and advance both iterators forward.
     If the first is less than the second, then advance the first iterator.
     If the first element is greater, then advance the second iterator.
     
     This runs in time O(n) because each iteration consumes at least one element, and there's only O(n) elements in total.
     
     
     
     -------
     we assume that we use BST, so the elements are in sorted order, so we do not need to sort them
     
     sort (we don't need), then iterate using an iterator to each element array:
     
     if A[iter1] > B[iter2]: increase iter2
     else if A[iter1] < B[iter2]: increase iter1
     else: element is in intersection, print and increase both iters
     
     Sorting is O(nlogn) (we don't need), iterating is O(n), total O(nlogn)
     */
}

- (NSSet *)dedup:(NSSet *)set
{
    NSMutableSet *dedup = [NSMutableSet new];
    for (id item in set) {
        if (![dedup containsObject:item]) {
            [dedup addObject:item];
        }
    }
    return [dedup copy];
}

- (NSSet *)whiteList:(NSSet *)set
{
    NSMutableSet *result = [NSMutableSet new];
    for (id item in set) {
        if ([set containsObject:item]) {
            [result addObject:item];
        }
    }
    return [result copy];

}

- (NSSet *)blackList:(NSSet *)set
{
    NSMutableSet *result = [NSMutableSet new];
    for (id item in set) {
        if (![set containsObject:item]) {
            [result addObject:item];
        }
    }
    return [result copy];

}

/*
- (BOOL) isEqual:(id)object
{
    if (!object)
    {
        return NO;
    }
    
    if (![object isKindOfClass:[PKTILocaleCriteria class]])
    {
        return NO;
    }
    
    if (self == object)
    {
        return YES;
    }
    
    return [self isEqualToLocaleCriteria:object];
}

- (BOOL) isEqualToLocaleCriteria:(PKTILocaleCriteria*)object
{
    return (self.voiceType == [object voiceType])
    && [self.locale isEqual:object.locale];
}

- (NSUInteger) hash
{
    NSUInteger prime = 31;
    NSUInteger result = 1;
    
    result = (prime * result) + self.voiceType; //for scalars
    result = (prime * result) + [self.locale hash]; //for objects
    
    return result;
}
*/


@end
