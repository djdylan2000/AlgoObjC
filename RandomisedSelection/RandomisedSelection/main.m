//
//  main.m
//  RandomisedSelection
//
//  Created by Dylan Colaco on 03/02/16.
//  Copyright © 2016 Dylan. All rights reserved.
//
// The algorithm returns the value of the ith order statistic
// in O(n) time on average.
// (ith statistic order = ith smallest element)
// e.g. 2nd statistic order of 5,3,4,6 is 4

#import <Foundation/Foundation.h>
#import <stdlib.h>


int ithOrderStatistic(NSMutableArray *array, int orderStatistic);
int rSelect(NSMutableArray *array, int left, int right, int orderStatistic);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *array = [NSMutableArray arrayWithArray:@[@5, @4, @2, @9, @17, @12, @19]];
        NSLog(@"The 3nd order statistic is %i", ithOrderStatistic(array, 3));
    }
    return 0;
}

int ithOrderStatistic(NSMutableArray *array, int orderStatistic){
    // Just a wrapper function
    // -1 on the order statistic to convert from 0 counting to 1 counting
    return rSelect(array, 0, (int)[array count] -1, orderStatistic-1);
}

int rSelect(NSMutableArray *array, int left, int right, int orderStatistic){
    if (right <= left){
        return [array[left] intValue];
    }
    // Choose a pivot element from valid array range and exchange it
    // with first element
    int randomPivotIndex = left + arc4random_uniform(right-left);
    [array exchangeObjectAtIndex:left withObjectAtIndex:randomPivotIndex];
    
    int i=left+1, j;
    
    // Run the partition step to separate elements < pivot and > pivot
    for (j = left + 1; j <= right; j++) {
        if (array[j] < array[left]) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:j];
            i++;
        }
    }
    // Put the pivot element in its 'right place'
    [array exchangeObjectAtIndex:i-1 withObjectAtIndex:left];
    
    if (i-1 == left + orderStatistic) {
        return [[array objectAtIndex:i-1] intValue];
    }
    else if (i-1 > left+ orderStatistic){
        return rSelect(array, left, i-2, orderStatistic);
    }
    else{
        return rSelect(array, i, right, orderStatistic+left-i);
    }
    
}

