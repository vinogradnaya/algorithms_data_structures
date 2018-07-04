//
//  Queue.m
//  playgournd_objc
//
//  Created by Burbulet on 11/14/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "Queue.h"
#import "LLNode.h"

@interface Queue()
@property (nonatomic, strong) LLNode *first;
@property (nonatomic, strong) LLNode *last;
@property (nonatomic, assign) NSUInteger count;
@end

@implementation Queue

- (void)enqueue:(NSNumber *)value
{
    LLNode *node = [[LLNode alloc] initWithValue:value];
    
    if (self.last != nil) {
        LLNode *oldLast = self.last;
        self.last = node;
        oldLast.next = self.last;
//        self.last.next = node;
//        self.last = node;
    } else {
        self.first = self.last = node;
    }
    self.count ++;
}

- (NSNumber *)dequeue
{
    if (self.first == nil) {
        return nil;
    }
    
    LLNode *oldFirst = self.first;
    self.first = oldFirst.next;
    
    if (self.first == nil) {
        self.last = nil;
    }
    
    self.count --;
    
    return oldFirst.value;
}

- (BOOL)isEmpty
{
    return self.first == nil;
}
@end
