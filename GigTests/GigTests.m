//
//  GigTests.m
//  GigTests
//
//  Created by guille on 09/09/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

#import "GigTests.h"

#import <Overcoat/Overcoat.h>

@implementation GigTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    OVCClient *client = [[OVCClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://localhost"]];
    STAssertNotNil(client, nil);
    
    NSDictionary *dictionary = @{@"foo": @"bar"};
    STAssertEqualObjects(@"bar", [dictionary ovc_objectForKeyPath:@"foo"], nil);
}

@end
