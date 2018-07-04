//
//  InsertionSort.h
//  playgournd_objc
//
//  Created by Burbulet on 10/27/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InsertionSort : NSObject
- (NSArray *)sort:(NSArray *)toSort;
- (NSArray *)sortNoExchange:(NSArray *)toSort;
@end
