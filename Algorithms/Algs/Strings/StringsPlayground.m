//
//  StringsPlayground.m
//  playgournd_objc
//
//  Created by Burbulet on 11/13/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "StringsPlayground.h"

@implementation StringsPlayground

- (void)charPlayground
{
    NSString *str = @"ABCDEFG";
    const char *charArray = [str cStringUsingEncoding:NSUTF8StringEncoding];
    size_t len = strlen(charArray);
    NSLog(@"length = %zu", len);

    char ames[] = "abc";
    char *mes = "abc";
    
    for (char c = 0; c < len ; c++) {
        char i = charArray[c];
        NSLog(@"%c", i);
        NSLog(@"%c", ames[c]);
        NSLog(@"%c", mes[c]);

    }
    
    char buffer[32];
    
    int i;
    for (i = 0; i < strlen(charArray); i++)
    {
        buffer[i] = charArray[i];
        NSLog(@"%c", buffer[i]);
    }
    printf("buffer : %s", buffer);
}

- (BOOL)hasAllUniqueChars:(NSString *)string
{
    BOOL allUnique = YES;
    
    int count [255] = {0};
    
    const char *chars = [string cStringUsingEncoding:NSASCIIStringEncoding];
    
    for (int i = 0; i < [string length]; i++) {
        char v = chars[i];
        count[v] = count[v] + 1;
        if (count[v] > 1) {
            allUnique = NO;
            break;
        }
    }
    
    return allUnique;
}

@end
