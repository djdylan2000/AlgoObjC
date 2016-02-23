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
NSMutableArray * DFS(Digraph *graph, Node *start, Node *end, NSMutableArray *path);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Digraph *dg = makeTestGraph();
        NSLog(@"%@", dg);
     
        
    }
    return 0;
}

NSMutableArray * DFS(Digraph *graph, Node *start, Node *end, NSMutableArray *pathr){
    
    NSMutableArray *path = [NSMutableArray arrayWithArray:pathr];
    [path addObject:start];
    NSLog(@"Current dfs path is %@", path);
    if([start isEqualTo:end]){
        return path;
    }
    for (Node *n in [graph childrenOfNode:start]){
        if (![path containsObject:n]){ // avoid cycles
            NSMutableArray *newPath = DFS(graph, n, end, path);
            if(newPath !=nil){
                return newPath;
            }
        }
    }
    return nil;
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
    DFS(g, myNodes[0], myNodes[5], [[NSMutableArray alloc] init]);
    return g;
    
}