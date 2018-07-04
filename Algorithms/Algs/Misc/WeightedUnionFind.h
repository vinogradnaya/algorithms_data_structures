//
//  WeightedUnionFind.h
//  playgournd_objc
//
//  Created by Burbulet on 11/8/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeightedUnionFind : NSObject
- (instancetype)initWithNumberOfElements:(NSUInteger)count;
- (void)unionOf:(NSUInteger)p with:(NSUInteger)q;
- (BOOL)isConnected:(NSUInteger)p to:(NSUInteger)q;
@end
