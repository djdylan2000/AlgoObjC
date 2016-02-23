//
//  WeightedEdge.h
//  Graphs
//
//  Created by Dylan Colaco on 23/02/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import "Edge.h"

@interface WeightedEdge : Edge
@property (nonatomic, readonly) float weight;
- (instancetype) initWithSource:(Node *)source withDestination:(Node *)destination withWeight:(float )weight;
@end
