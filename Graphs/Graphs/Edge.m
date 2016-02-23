//
//  Edge.m
//  Graphs
//
//  Created by Dylan Colaco on 23/02/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import "Edge.h"
@interface Edge ()
@property (nonatomic, strong, readwrite) Node *source;
@property (nonatomic, strong, readwrite) Node *destination;
@end

@implementation Edge

-(instancetype) initWithSource:(Node *)source withDestination: (Node *) destination{
    self = [super self];
    
    if (self){
        self.source = source;
        self.destination = destination;
    }
    return self;
}

- (NSString *) description{
    NSString *stringRep = [NSString stringWithFormat:@"%@->%@", self.source, self.destination];
    return stringRep;
}



@end
