//
//  main.m
//  MergeSort O(nlogn)
//
//  Created by Dylan Colaco on 28/01/16.
//  Copyright © 2016 Dylan Colaco. All rights reserved.
//

#import <Foundation/Foundation.h>

NSArray * Merge(NSArray *left, NSArray *right){
    
    // get lengths of the left and right arrays
    NSUInteger leftsize = [left count];
    NSUInteger rightsize = [right count];
    
    // initialize indices for walking through left and right arrays
    int i=0, j=0;
    
    // initialize array to add objects into in sorted order
    NSMutableArray *merged = [[NSMutableArray alloc] init];
    
    // compare front elements of left and right, put smaller into merged
    while (i < leftsize && j < rightsize) {
        if (left[i] < right[j]){
            [merged addObject:left[i++]];
        }
        else{
            [merged addObject:right[j++]];
        }
    }
    
    // if no more elements present in right array
    while (i<leftsize){
        [merged addObject:left[i++]];
    }
    
    // if no more elements present in left array
    while (j<rightsize){
        [merged addObject:right[j++]];
    }
    
    // returning an immutable version of merged array
    return [NSArray arrayWithArray:merged];
}

NSArray * MergeSort(NSArray *anArray){
    NSUInteger arraySize = [anArray count];
    if (arraySize <= 1) {
        return anArray; // base case of recursion
    }
    
    // ranges for splitting array in (almost in odd length case) equal halves
    NSRange leftRange = NSMakeRange(0, arraySize/2);
    NSRange rightRange = NSMakeRange(arraySize/2, arraySize-arraySize/2);
    
    NSArray *left = [anArray subarrayWithRange:leftRange];
    NSArray *right = [anArray subarrayWithRange:rightRange];
    
    // recursively call mergesort on left and right sub-arrays
    left = MergeSort(left);
    right = MergeSort(right);
    
    return Merge(left, right);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Array of unsorted numbers
        NSArray *testArray = @[@3, @1, @2, @9, @7, @1, @6];
        NSArray *sortedArray = MergeSort(testArray);
        NSLog(@"sorted array: %@", sortedArray);
    return 0;
    }
}
