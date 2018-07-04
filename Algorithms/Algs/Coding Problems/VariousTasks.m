//
//  VariousTasks.m
//  playgournd_objc
//
//  Created by Burbulet on 11/27/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "VariousTasks.h"

@implementation VariousTasks

- (NSArray <NSString *> *)reserseSpecialArray:(NSArray <NSString *> *)input
{
    if (input == nil) return nil;
    
    NSMutableArray *reverse = [[NSMutableArray alloc] initWithArray:input];
    
    NSCharacterSet *alphabet = [NSCharacterSet letterCharacterSet];
    
    NSUInteger i = 0;
    NSUInteger j = [input count] - 1;
    
    while (i < j) {
        while (![alphabet characterIsMember:[reverse[i] characterAtIndex:0]] && i < j) {
            i++;
        }
        
        while (![alphabet characterIsMember:[reverse[j] characterAtIndex:0]] && i < j) {
            j--;
        }
        
        [reverse exchangeObjectAtIndex:i++ withObjectAtIndex:j--];
    }
    
    return [reverse copy];
}
@end
