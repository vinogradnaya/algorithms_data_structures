//
//  MergeSort.m
//  playgournd_objc
//
//  Created by Burbulet on 10/28/17.
//  Copyright © 2017 Kateryna Vynogradna. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort
- (NSArray *)sort:(NSArray *)toSort
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[toSort copy]];
    [self sortArray:array low:0 high:[array count] - 1];
    return [array copy];
}

- (void)sortArray:(NSMutableArray *)array low:(NSInteger)low high:(NSInteger)high
{
    if (high <= low) {
        return;
    }
    NSInteger mid = low + (high - low)/2;
    
    //  если дальше делить уже некуда - это метод sort returns, и выполнение переходит к следующему методу. То есть когда у нас сорт принимает на вход 1 или 2 элемента, то его sort методы просто возвращают return и мерджится этот массив из 1 или 2х элементов. Таким образом ретурнится в вызовах высшего порядка первый сорт. Затем так же делится и мерджится второй сорт и тд.
    // То есть сначала - делится и мерджится правая половина, а потом левая
    // сама сортировка происходит в методе merge по сути
    [self sortArray:array low:low high:mid];
    [self sortArray:array low:mid+1 high:high];
    [self mergeIntoArray:array low:low mid:mid high:high];
}

- (void)mergeIntoArray:(NSMutableArray *)array low:(NSInteger)low mid:(NSInteger)mid high:(NSInteger)high
{
    NSInteger i = low;
    NSInteger j = mid + 1;
    
    NSArray *aux = [array copy];
    
    for (NSInteger k = low; k<=high; k++) {
        if (i > mid) {
            // если мы израсходовали всю первую половинку (левую) - просто увеличиваем счетчик второй и записываем в окончательный массив
            array[k] = aux[j++];
        } else if (j > high) {
            // если мы израсходовали вторую половинку (правую) - значит там элементы были меньше, чем в первой, то первую мы просто копируем в ее порядке в окончательный массив
            array[k] = aux[i++];
        } else if ([aux[j] compare:aux[i]] < 0) {
            // если элемент из второй половинки меньше, чем элемент из первой - берем его и переходим к следующему элементу второй половинки. Элемент первой половинки не увеличиваем - с ним же и будем сравнивать в следующий раз
            array[k] = aux[j++];
        } else {
            array[k] = aux[i++];
            // если элемент из первой меньше, чем элемент из второй - берем его и переходим к следующему элементу первой половинки. Элемент второй половинки не увеличиваем - с ним же и будем сравнивать в следующий раз

        }
    }
}

- (NSArray *)sortBottomUp:(NSArray *)toSort
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[toSort copy]];
    NSInteger N = [array count];
    for (NSInteger sz = 1; sz < N; sz = sz+sz) {
        for (NSInteger low = 0; low < N - sz; low += sz+sz) {
            NSInteger high = MIN((low + sz + sz - 1), N-1);
//            NSInteger mid = (low + (high - low)/2);
            NSInteger mid = (low + sz - 1);
            NSLog(@"low = %li, mid = %li, high = %li \n", low, mid, high);
            NSLog(@"size = %li", sz);
            [self mergeIntoArray:array low:low mid:mid high:high];
            NSLog(@"after merge = %@", array);
        }
    }
    return [array copy];
}

@end
