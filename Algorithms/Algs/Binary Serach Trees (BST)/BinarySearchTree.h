//
//  BinarySearchTree.h
//  playgournd_objc
//
//  Created by Burbulet on 11/1/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinarySearchTree : NSObject
- (void)setObject:(id)object forKey:(NSString *)key;
- (id)objectForKey:(NSString *)key;
- (NSString *)minKey;
- (NSString *)floor:(NSString *)key;
- (NSInteger)rank:(NSString *)key; // number of keys smaller than key
- (NSString *)selectKeyWithRank:(NSInteger)rank;
- (NSArray *)keysInRangeLow:(NSString *)low high:(NSString *)high;
- (void)print;

- (void)preOrderTraversalRecursive;
- (void)postOrderTraversalRecursive;
- (void)inOrderTraversalRecursive;

- (void)preOrderTraversalIterative;
- (void)postOrderTraversalIterative;
- (void)inOrderTraversalIterative;
- (void)levelOrderTraversalIterative;

@end
