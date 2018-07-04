//
//  LRUCache.m
//  playgournd_objc
//
//  Created by Burbulet on 12/16/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "LRUCache.h"

static const NSUInteger kLRUCacheDefaultMaxSize = 20;

NS_ASSUME_NONNULL_BEGIN

@interface LRUNode : NSObject
@property (nonatomic, strong) id value;
@property (nonatomic, copy, readonly) NSString *key;
@property (nonatomic, strong, nullable) LRUNode *next;
@property (nonatomic, strong, nullable) LRUNode *prev;

- (nullable instancetype)initWithValue:(id)value key:(NSString *)key;

@end
NS_ASSUME_NONNULL_END


@implementation LRUNode

- (instancetype)initWithValue:(id)value key:(NSString *)key
{
    self = [super init];
    if (self) {
        _value = value;
        _key = key;
    }
    return self;
}

@end

@interface LRUCache ()
@property (nonatomic, strong) NSMutableDictionary <NSString *, LRUNode *> *cache;
@property (nonatomic, strong) LRUNode *first;
@property (nonatomic, strong) LRUNode *last;
@property (nonatomic, copy) dispatch_queue_t serialQueue;
@property (nonatomic, assign) NSUInteger maxSize;
@end

@implementation LRUCache

- (instancetype)initWithMaxSize:(NSUInteger)maxSize
{
    self = [super init];
    if (self) {
        _serialQueue = dispatch_queue_create("com.fb.lrucache.serial.queue", DISPATCH_QUEUE_SERIAL);
        _cache = [[NSMutableDictionary alloc] initWithCapacity:maxSize];
        _maxSize = maxSize;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithMaxSize:kLRUCacheDefaultMaxSize];
}

- (void)insertObject:(id)object forKey:(NSString *)key
{
    dispatch_async(self.serialQueue, ^{
        NSLog(@"insertObject for key %@", key);
        LRUNode *node = [self.cache objectForKey:key];
        if (node == nil) {
            node = [[LRUNode alloc] initWithValue:object key:key];
            [self enqueue:node];
        } else {
            [self moveToFront:node];
        }
    });
}

- (id)objectForKey:(NSString *)key
{
    __block LRUNode *node = nil;
    dispatch_sync(self.serialQueue, ^{
        NSLog(@"object for key = %@", key);
        node = [self.cache objectForKey:key];
        if (node != nil) {
            dispatch_async(self.serialQueue, ^{
                [self moveToFront:node];
            });
        }
    });
    NSLog(@"return object for key = %@", key);
    return node.value;
}

- (void)moveToFront:(LRUNode *)node
{
    NSLog(@"moveToFront %@", node.key);

    if (self.first == node) {
        NSLog(@"moveToFront is already first %@", node.key);
        return;
    }
    
    LRUNode *oldFirst = self.first;
    
    if (oldFirst == nil) {
        self.first = node;
        self.last = node;
        NSLog(@"moveToFront is very first %@", self.first.key);
        return;
    }
    
    LRUNode *prev = node.prev;
    LRUNode *next = node.next;
        
    prev.next = next;
    next.prev = prev;
    
    if (self.last == node) {
        self.last = prev;
    }
        
    oldFirst.prev = node;
    node.next = oldFirst;
    node.prev = nil;
    self.first = node;
    
    NSLog(@"moveToFront new first %@", self.first.key);
    
    NSLog(@"moveToFront result");
    LRUNode *test = self.first;
    while (test != nil) {
        NSLog(@"node = %@", test.key);
        NSLog(@"node prev = %@", test.prev.key);
        NSLog(@"node next = %@", test.next.key);
        test = test.next;
    }

}

- (void)dequeue
{
    NSLog(@"dequeue key %@", self.last.key);

    [self.cache removeObjectForKey:self.last.key];
    
    LRUNode *newLast = self.last.prev;
    if (newLast != nil) {
        newLast.next = nil;
    } else {
        self.first = nil;
    }
    self.last = newLast;
    
    NSLog(@"dequeue key new last %@", self.last.key);
}

- (void)enqueue:(LRUNode *)node
{
    NSLog(@"enqueue for key %@", node.key);

    if ([self.cache count] == self.maxSize) {
        [self dequeue];
    }
    [self.cache setObject:node forKey:node.key];
    [self moveToFront:node];
}

@end
