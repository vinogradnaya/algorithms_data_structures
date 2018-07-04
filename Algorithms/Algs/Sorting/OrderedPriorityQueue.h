//
//  OrderedPriorityQueue.h
//  playgournd_objc
//
//  Created by Burbulet on 10/31/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderedPriorityQueue : NSObject
- (void)insert:(id)key;
- (void)insertVar:(id)key;

- (id)delMax;
- (void)print;

@end
