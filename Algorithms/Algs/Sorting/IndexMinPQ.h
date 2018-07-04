//
//  IndexMinPQ.h
//  playgournd_objc
//
//  Created by Burbulet on 11/10/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IndexMinPQ : NSObject
- (instancetype)initWithNumberOfKeys:(NSUInteger)count;
- (void)insertKey:(id)key forIndex:(NSUInteger)index;
- (NSUInteger)deleteMinKey;
- (void)changeKey:(id)key forIndex:(NSUInteger)index;
- (BOOL)isEmpty;
- (BOOL)containsIndex:(NSUInteger)index;
@end
