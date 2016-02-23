//
//  main.m
//  DFS
//
//  Created by Dylan Colaco on 23/02/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Digraph.h"

Digraph * makeTestGraph(void);
NSArray * DFS(Digraph *graph, Node *start, Node *end, NSMutableArray *pathr, NSArray *shortest);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Digraph *dg = makeTestGraph();
        NSLog(@"%@", dg);
     
        
    }
    return 0;
}

NSArray * DFS(Digraph *graph, Node *start, Node *end, NSMutableArray *pathr, NSArray *shortest){
    
    NSMutableArray *path = [NSMutableArray arrayWithArray:pathr];
    [path addObject:start];
    
    NSLog(@"Current dfs path is %@", path);
    if([start isEqualTo:end]){
        return path;
    }
    for (Node *n in [graph childrenOfNode:start]){
        if (![path containsObject:n]){ // avoid cycles
            if(shortest==nil || [path count]< [shortest count]){
                NSArray *newPath = DFS(graph, n, end, path, shortest);
                if(newPath !=nil){
                    shortest = newPath;
                }
            }
        }
    }
    return shortest;
}

Digraph * makeTestGraph(void){
    NSMutableArray *myNodes = [[NSMutableArray alloc] init];
    for (int i = 0; i < 6; i++){
        NSString *nodeName = [NSString stringWithFormat:@"Node%d", i];
        [myNodes addObject:[[Node alloc] initWithName:nodeName]];
    }
    Digraph *g = [[Digraph alloc] init];
    for (Node *n in myNodes){
        [g addNode:n];
    }
    [g addEdge:[[Edge alloc] initWithSource:myNodes[0] withDestination:myNodes[1]]];
    [g addEdge:[[Edge alloc] initWithSource:myNodes[1] withDestination:myNodes[2]]];
    [g addEdge:[[Edge alloc] initWithSource:myNodes[2] withDestination: myNodes[3]]];
    [g addEdge:[[Edge alloc] initWithSource:myNodes[2] withDestination: myNodes[4]]];
    [g addEdge:[[Edge alloc] initWithSource:myNodes[3] withDestination: myNodes[4]]];
    [g addEdge:[[Edge alloc] initWithSource:myNodes[3] withDestination: myNodes[5]]];
    [g addEdge:[[Edge alloc] initWithSource:myNodes[0] withDestination: myNodes[2]]];
    [g addEdge:[[Edge alloc] initWithSource:myNodes[1] withDestination: myNodes[0]]];
    [g addEdge:[[Edge alloc] initWithSource:myNodes[3] withDestination: myNodes[1]]];
    [g addEdge:[[Edge alloc] initWithSource:myNodes[4] withDestination: myNodes[0]]];
    NSArray *shortestPath =  DFS(g, myNodes[0], myNodes[5], [[NSMutableArray alloc] init], nil); // in reality I would use a wrapper function to avoid unnecessary arguments
    NSLog(@"shortest path: %@", shortestPath);
    return g;
    
}