//
//  Stack.h
//  playgournd_objc
//
//  Created by Burbulet on 11/14/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject
- (void)push:(NSNumber *)value;
- (NSNumber *)pop;
- (BOOL)isEmpty;
@end
