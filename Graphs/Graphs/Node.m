//
//  Node.m
//  Graphs
//
//  Created by Dylan Colaco on 23/02/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import "Node.h"
@interface Node ()
@property (nonatomic, readwrite) NSString *name;

@end

@implementation Node

- (instancetype) initWithName:(NSString *) name{
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

- (NSString *) description{
    return self.name;
}

@end
