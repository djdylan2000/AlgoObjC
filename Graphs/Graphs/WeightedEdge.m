//
//  WeightedEdge.m
//  Graphs
//
//  Created by Dylan Colaco on 23/02/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import "WeightedEdge.h"

@interface WeightedEdge()
@property (nonatomic, readwrite) float weight;

@end

@implementation WeightedEdge

- (instancetype) initWithSource:(Node *)source withDestination:(Node *)destination withWeight:(float )weight{
    self = [super initWithSource:source withDestination:destination];
    if (self){
        self.weight = weight;
    }
    return self;
}

- (instancetype) initWithSource:(Node *)source withDestination:(Node *)destination{
    return [self initWithSource:source withDestination:destination withWeight:1.0];
}

@end
