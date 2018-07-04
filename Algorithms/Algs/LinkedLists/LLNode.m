//
//  Node.m
//  playgournd_objc
//
//  Created by Burbulet on 11/14/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "LLNode.h"

@interface LLNode()
@property (nonatomic, strong) NSNumber *value;
@end

@implementation LLNode

- (instancetype) initWithValue:(NSNumber *)value
{
    self = [super init];
    if (self) {
        _value = value;
    }
    return self;
}

@end
