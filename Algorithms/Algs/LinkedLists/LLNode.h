//
//  Node.h
//  playgournd_objc
//
//  Created by Burbulet on 11/14/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLNode : NSObject
@property (nonatomic, strong) LLNode *next;
- (instancetype) initWithValue:(NSNumber *)value;
- (NSNumber *)value;
@end
