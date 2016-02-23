//
//  main.m
//  Graphs
//
//  Created by Dylan Colaco on 23/02/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Graph.h"
#import "Digraph.h"

void test(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // testing Node class
        Node *first = [[Node alloc] initWithName:@"first"];
        NSLog(@"Node: %@", first);
        Node *second =  [[Node alloc] initWithName:@"second"];
        NSLog(@"Node: %@", second);
        
        //testing edge class
        Edge *one = [[Edge alloc] initWithSource:first withDestination:second];
        NSLog(@"Edge: %@", one);
        
        // testing Digraph
        test();
        
    }
    return 0;
}

void test(void){
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
    NSLog(@"Graph:\n%@",g);
    
}