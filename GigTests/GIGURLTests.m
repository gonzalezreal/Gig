//
//  GIGURLTests.m
//  Gig
//
//  Created by guille on 22/05/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGURLTests : SenTestCase

@property (strong, nonatomic) GIGURL *testURL;

@end

@implementation GIGURLTests

- (void)setUp {
    [super setUp];

    NSDictionary *representation = @{
            @"url" : @"http://t.co/IOwBrTZR",
            @"indices" : @[@32, @52],
            @"display_url" : @"youtube.com/watch?v=oHg5SJ\u2026",
            @"expanded_url" : @"http://www.youtube.com/watch?v=oHg5SJYRHA0"
    };

    self.testURL = [MTLJSONAdapter modelOfClass:GIGURL.class fromJSONDictionary:representation error:NULL];
}

- (void)tearDown {
    self.testURL = nil;
    [super tearDown];
}

- (void)testThatURLExists {
    STAssertNotNil(self.testURL, nil);
}

- (void)testThatURLInitializes {
    STAssertEqualObjects(self.testURL.URL,[NSURL URLWithString:@"http://t.co/IOwBrTZR"], nil);
    STAssertEquals(self.testURL.range, NSMakeRange(32, 20), nil);
    STAssertEqualObjects(self.testURL.displayURL, @"youtube.com/watch?v=oHg5SJ\u2026", nil);
    STAssertEqualObjects(self.testURL.expandedURL,[NSURL URLWithString:@"http://www.youtube.com/watch?v=oHg5SJYRHA0"], nil);
}

@end
