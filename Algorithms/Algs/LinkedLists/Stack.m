//
//  Stack.m
//  playgournd_objc
//
//  Created by Burbulet on 11/14/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "Stack.h"
#import "LLNode.h"

@interface Stack()
@property (nonatomic, strong) LLNode *top;
@property (nonatomic, assign) NSUInteger count;
@end

@implementation Stack

- (void)push:(NSNumber *)value
{
    LLNode *new = [[LLNode alloc] initWithValue:value];
    new.next = self.top;
    self.top = new;
    self.count ++;
}

- (NSNumber *)pop
{
    if (self.top == nil) {
        return nil;
    }
    
    LLNode *top = self.top;
    self.top = self.top.next;
    self.count--;
    return top.value;
}

- (BOOL)isEmpty
{
    return self.top == nil;;
}

@end
