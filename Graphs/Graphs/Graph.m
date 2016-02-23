//
//  Graph.m
//  Graphs
//
//  Created by Dylan Colaco on 23/02/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import "Graph.h"

@implementation Graph

-(void) addEdge:(Edge *)edge{
    [super addEdge:edge];
    Edge *reversed = [[Edge alloc] initWithSource:edge.destination withDestination:edge.source];
    [super addEdge:reversed];
}

@end
