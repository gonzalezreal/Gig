//
//  GIGHashtagTests.m
//  Gig
//
//  Created by guille on 22/05/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGHashtagTests : SenTestCase

@property (strong, nonatomic) GIGHashtag *hashtag;

@end

@implementation GIGHashtagTests

- (void)setUp {
    [super setUp];

    NSDictionary *representation = @{
            @"indices" : @[@32, @36],
            @"text" : @"lol"
    };

    self.hashtag = [MTLJSONAdapter modelOfClass:GIGHashtag.class fromJSONDictionary:representation error:NULL];
}

- (void)tearDown {
    self.hashtag = nil;
    [super tearDown];
}

- (void)testThatHashtagExists {
    STAssertNotNil(self.hashtag, nil);
}

- (void)testThatHashtagInitializes {
    STAssertEquals(self.hashtag.range, NSMakeRange(32, 4), nil);
    STAssertEqualObjects(self.hashtag.text, @"lol", nil);
}

@end
