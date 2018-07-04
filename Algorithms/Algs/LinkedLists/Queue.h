//
//  Queue.h
//  playgournd_objc
//
//  Created by Burbulet on 11/14/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject
- (void)enqueue:(NSNumber *)value;
- (NSNumber *)dequeue;
- (BOOL)isEmpty;
@end
