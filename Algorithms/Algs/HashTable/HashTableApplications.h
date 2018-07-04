//
//  SetIntersection.h
//  playgournd_objc
//
//  Created by Burbulet on 11/4/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashTableApplications : NSObject
- (NSSet *)intersection:(NSSet *)initialSet;

// remove duplicates
- (NSSet *)dedup:(NSSet *)set;

- (NSSet *)whiteList:(NSSet *)set; // if the item is in set, we add it to the output set, otherwise we don't
 - (NSSet *)blackList:(NSSet *)set; // if the item is in set, we do not add it to the output set


@end
