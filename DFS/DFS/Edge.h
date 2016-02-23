//
//  Edge.h
//  Graphs
//
//  Created by Dylan Colaco on 23/02/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface Edge : NSObject
@property (nonatomic, strong, readonly) Node *source;
@property (nonatomic, strong, readonly) Node *destination;

-(instancetype) initWithSource:(Node *)source withDestination: (Node *) destination;

@end
