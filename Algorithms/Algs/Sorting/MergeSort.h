//
//  MergeSort.h
//  playgournd_objc
//
//  Created by Burbulet on 10/28/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MergeSort : NSObject
- (NSArray *)sort:(NSArray *)toSort;
- (NSArray *)sortBottomUp:(NSArray *)toSort;
@end
