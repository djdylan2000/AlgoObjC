//
//  Node.h
//  Graphs
//
//  Created by Dylan Colaco on 23/02/16.
//  Copyright © 2016 Dylan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
@property (nonatomic, readonly) NSString *name;
- (instancetype) initWithName:(NSString *) name;

@end
