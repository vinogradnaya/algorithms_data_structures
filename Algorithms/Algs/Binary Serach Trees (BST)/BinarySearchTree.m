//
//  BinarySearchTree.m
//  playgournd_objc
//
//  Created by Burbulet on 11/1/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "BinarySearchTree.h"

@interface Node: NSObject
@property (nonatomic, copy) NSString *key;
@property (nonatomic, strong) id value;
@property (nonatomic, strong) Node *left;
@property (nonatomic, strong) Node *right;
@property (nonatomic, assign) NSInteger size;

- (instancetype)initWithKey:(NSString *)key value:(id)value;
@end

@implementation Node

- (instancetype)initWithKey:(NSString *)key value:(id)value
{
    self = [super init];
    if (self) {
        _key = [key copy];
        _value = value;
        _size = 1;
    }
    return self;
}

@end


@interface BinarySearchTree ()
@property (nonatomic, strong) Node *root;
@end

@implementation BinarySearchTree

- (void)setObject:(id)object forKey:(NSString *)key
{
    self.root = [self setObject:object forKey:key node:self.root];
}

- (Node *)setObject:(id)object forKey:(NSString *)key node:(Node *)node
{
    NSLog(@"key = %@, node = %@", key, node.key);
    
    if (node == nil) {
        Node *newNode = [[Node alloc] initWithKey:key value:object];
        return newNode;
    }
    
    NSComparisonResult compare = [key compare:node.key];
    if (compare == NSOrderedAscending) {
        node.left = [self setObject:object forKey:key node:node.left];
    } else if (compare == NSOrderedDescending) {
        node.right = [self setObject:object forKey:key node:node.right];
    } else {
        node.value = object;
    }
    
    node.size = node.left.size + node.right.size + 1;
    return node;
}

- (id)objectForKey:(NSString *)key
{
    return [self objectForKey:key startingAtNode:self.root];
}

- (id)objectForKey:(NSString *)key startingAtNode:(Node *)node
{
    NSLog(@"get object for key %@, node: %@", key, node.key);
    if (node == nil) {
        return nil;
    }
    NSComparisonResult compare = [key compare:node.key];
    if (compare == NSOrderedAscending) {
        return [self objectForKey:key startingAtNode:node.left];
    } else if (compare == NSOrderedDescending) {
        return [self objectForKey:key startingAtNode:node.right];
    } else {
        return node.value;
    }
}

- (NSString *)minKey
{
    Node *min = [self minNodeStartingAtNode:self.root];
    return min.key;
}

- (Node *)minNodeStartingAtNode:(Node *)node
{
    if (node.left != nil) {
        return [self minNodeStartingAtNode:node.left];
    } else {
        return node;
    }
}

- (NSString *)floor:(NSString *)key
{
    return [self floor:key node:self.root].key;
}

- (Node *)floor:(NSString *)key node:(Node *)node
{
    if (node == nil) return nil;
    
    NSComparisonResult compare = [key compare:node.key];
    if (compare == NSOrderedSame) {
        return node;
    } else if (compare == NSOrderedAscending) {
        return [self floor:key node:node.left];
    }
    Node *candidate = [self floor:key node:node.right];
    if (candidate != nil) {
        return candidate;
    } else {
        return node;
    }
}

- (NSInteger)rank:(NSString *)key
{
    return [self rank:key node:self.root];
}

- (NSInteger)rank:(NSString *)key node:(Node *)node
{
    if (node == nil) {
        return 0;
    }
    
    NSComparisonResult compare = [key compare:node.key];
    if (compare == NSOrderedAscending) {
        return [self rank:key node:node.left];
    } else if (compare == NSOrderedDescending) {
        return 1 + node.left.size + [self rank:key node:node.right];
    } else {
        return node.left.size;
    }
}

- (NSString *)selectKeyWithRank:(NSInteger)rank
{
    return [self selectKeyWithRank:rank node:self.root].key;
}

- (Node *)selectKeyWithRank:(NSInteger)rank node:(Node *)node
{
    if (node == nil) {
        return nil;
    }
    
    NSInteger size = node.left.size;
    if (size > rank) {
        return [self selectKeyWithRank:rank node:node.left];
    } else if (size < rank) {
        return [self selectKeyWithRank:rank - size - 1 node:node.right];
    } else {
        return node;
    }
}

- (NSArray *)keysInRangeLow:(NSString *)low high:(NSString *)high
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [self keysInRangeLow:low high:high array:array node:self.root];
    return [array copy];
}

- (void)keysInRangeLow:(NSString *)low high:(NSString *)high array:(NSMutableArray *)array node:(Node *)node
{
    if (node == nil) {
        return;
    }
    
    NSComparisonResult cmpLow = [low compare:node.key];
    NSComparisonResult cmpHigh = [high compare:node.key];

    if (cmpLow == NSOrderedAscending) {
        [self keysInRangeLow:low high:high array:array node:node.left];
    }
    if (cmpLow <= 0 && cmpHigh >= 0) {
        [array addObject:node.key];
    }
    if (cmpHigh > 0) {
        [self keysInRangeLow:low high:high array:array node:node.right];
    }
}

- (void)print
{
    [self print:self.root];
}

- (void)print:(Node*)node
{
    if (node == nil) {
        return;
    }
    
    [self print:node.left];
    NSLog(@"%@", node.key);
    [self print:node.right];
}

// dfs
- (void)preOrderTraversalRecursive
{
    [self preorder:self.root];
}

- (void)preorder:(Node *)node
{
    if (node == nil) {
        return;
    }
    
    NSLog(@"node key: %@ value = %@", node.key, node.value);
    // its possible to add the node to the queue to print later
    
    [self preorder:node.left];
    [self preorder:node.right];
}

//dfs
- (void)postOrderTraversalRecursive
{
    [self postOrder:self.root];
}

- (void)postOrder:(Node *)node
{
    if (node == nil) {
        return;
    }
    
    [self postOrder:node.left];
    [self postOrder:node.right];

    NSLog(@"node key: %@ value = %@", node.key, node.value);
    // its possible to add the node to the queue to print later
}

//dfs
- (void)inOrderTraversalRecursive
{
    [self inOrder:self.root];
}

- (void)inOrder:(Node *)node
{
    if (node == nil) {
        return;
    }
    
    [self inOrder:node.left];
    
    NSLog(@"node key: %@ value = %@", node.key, node.value);
    // its possible to add the node to the queue to print later

    [self inOrder:node.right];
}

// the difference between the pre and post order is basically how you put items on the stack - right then left in pre (so that they go out in reverse), and left then right and then add to stack in the post
- (void)preOrderTraversalIterative
{
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    NSMutableArray *queue = [NSMutableArray new];
    
    [stack addObject:self.root];
    
    while ([stack count] > 0) {
        Node *node = [stack lastObject];
        [stack removeLastObject];
        
        [queue addObject:node];
        [stack addObject:node.right];
        [stack addObject:node.left];
    }
    
    NSLog(@"pre order iterative = %@", queue);
}

- (void)postOrderTraversalIterative
{
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    NSMutableArray *queue = [NSMutableArray new];
    
    [stack addObject:self.root];
    
    while ([stack count] > 0) {
        Node *node = [stack lastObject];
        [stack removeLastObject];
        
        [queue addObject:node];
        [stack addObject:node.left];
        [stack addObject:node.right];
    }
    
    // this will print items in reserse post order, to print the items in post order you need to print the array from the last to first
    NSLog(@"reserse post order iterative = %@", queue);
}

//- (void)inOrderTraversalIterative
//{
//    NSMutableArray <Node *> *stack = [[NSMutableArray alloc] init];
//    [stack addObject:self.root];
//
//    NSMutableArray <NSString *> *queue = [NSMutableArray new];
//
//    Node *node = self.root;
//    while ([stack count] > 0) {
//
//        while (node.left != nil) {
//            [stack addObject:node.left];
//            node = node.left;
//        }
//
//        [queue addObject:[stack lastObject].key];
//        [stack removeLastObject];
//
//        if (node.right != nil) {
//            [stack addObject:node.right];
//            node = node.right;
//        } else {
//            while ([stack count] > 0) {
//                node = [stack lastObject];
//                [queue addObject:[stack lastObject].key];
//                [stack removeLastObject];
//                if (node.right != nil) {
//                    [stack addObject:node.right];
//                    node = node.right;
//                    break;
//                }
//            }
//        }
//    }
//}

- (void)inOrderTraversalIterative
{
    NSMutableArray <Node *> *stack = [[NSMutableArray alloc] init];
    NSMutableArray <NSString *> *queue = [NSMutableArray new];
    
    Node *node = self.root;
    while (node != nil) {
        [stack addObject:node];
        node = node.left;
    }
    
    while ([stack count] > 0) {
        node = [stack lastObject];
        [stack removeLastObject];
        
        [queue addObject:node.key];

        if (node.right != nil) {
            node = node.right;
            while (node != nil) {
                [stack addObject:node];
                node = node.left;
            }
        }
    }
    NSLog(@"in order iterative = %@", queue);
}

//bfs
- (void)levelOrderTraversalIterative
{
    NSMutableArray <Node *> *queue = [NSMutableArray new];
    [queue addObject:self.root];
    
    NSMutableArray <NSString *> *printQueue = [NSMutableArray new];
    
    while ([queue count] > 0) {
        Node *node = [queue firstObject];
        [printQueue addObject:node.value];
        [queue removeObjectAtIndex:0];
        
        if (node.left != nil) {
            [queue addObject:node.left];
        }
        
        if (node.right != nil) {
            [queue addObject:node.right];
        }
    }
}

@end
