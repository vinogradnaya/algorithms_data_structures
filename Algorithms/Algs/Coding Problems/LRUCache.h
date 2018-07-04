//
//  LRUCache.h
//  playgournd_objc
//
//  Created by Burbulet on 12/16/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRUCache : NSObject

- (instancetype)initWithMaxSize:(NSUInteger)maxSize;

- (void)insertObject:(id)object forKey:(NSString *)key;
- (id)objectForKey:(NSString *)key;

@end
