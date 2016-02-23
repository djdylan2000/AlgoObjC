//
//  Digraph.h
//  Graphs
//
//  Created by Dylan Colaco on 23/02/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
#import "Edge.h"

@interface Digraph : NSObject

-(void) addNode:(Node *)node;
-(void) addEdge:(Edge *)edge;
- (NSArray *) childrenOfNode:(Node*)node; // of nodes
- (BOOL) hasNode:(Node *) node;

@end
