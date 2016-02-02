//
//  main.m
//  QuickSort
//
//  Created by Dylan Colaco on 02/02/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdlib.h>

void quickSort(NSMutableArray *array);
void partition(NSMutableArray *array, int left, int right);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *anArray = [NSMutableArray arrayWithArray:@[@3, @5, @6, @9, @7, @8, @2]];
        quickSort(anArray);
        NSLog(@"quick sorted arrayl: %@", anArray);
    }
    return 0;
}


void quickSort(NSMutableArray *array){
    // Just a wrapper function to call partition
    partition(array, 0, (int)[array count] - 1);
}


void partition(NSMutableArray *array, int left, int right){
    // The base case
    if (right - left < 1) {
        return;
    }
    // Generate a random int in the range [left right]
    // Random pivot gives running time of O(nlogn) on average
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
    
    // Recursively call partition on left and right sub-arrays
    partition(array, left, i-2);
    partition(array, i, right);
}
