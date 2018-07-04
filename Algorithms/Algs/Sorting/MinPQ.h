//
//  MinPQ.h
//  playgournd_objc
//
//  Created by Burbulet on 11/7/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MinPQ : NSObject
- (instancetype)initWithArray:(NSArray *)array;
- (void)insert:(id)key;
- (id)delMin;
- (BOOL)isEmpty;
@end
