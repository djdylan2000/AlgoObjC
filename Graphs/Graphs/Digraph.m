//
//  Digraph.m
//  Graphs
//
//  Created by Dylan Colaco on 23/02/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import "Digraph.h"

@interface Digraph ()
@property (nonatomic, strong) NSMutableSet * nodes;
@property (nonatomic, strong) NSMutableDictionary * edges;
@end

@implementation Digraph

- (instancetype) init{
    self = [super init];
    if (self){
        self.nodes = [[NSMutableSet alloc] init];
        self.edges = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void) addNode:(Node *)node{
    [self.nodes addObject:node];
    NSMutableArray *nodelist = [[NSMutableArray alloc] init];
    [self.edges setValue:nodelist forKey:node.name];
}

- (void) addEdge:(Edge *)edge{
    if(![self.nodes containsObject:edge.source] && ![self.nodes containsObject:edge.destination]){
        NSLog(@"error, node not found");
    }
    [self.edges[edge.source.name] addObject:edge.destination];
}

- (NSArray *) childrenOfNode:(Node *)node{
    return self.edges[node.name];
}

- (BOOL) hasNode:(Node *)node{
    return [self.nodes containsObject:node];
}

- (NSString *) description{
    NSMutableString *res = [[NSMutableString alloc] init];
    for (NSString *key in self.edges){
        for (Node *node in self.edges[key]){
            [res appendFormat:@"%@->%@\n", key, node];
        }
    }
    
    
    return res;
}

@end
