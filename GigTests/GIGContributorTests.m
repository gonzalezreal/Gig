//
//  GIGContributorTests.m
//  Gig
//
//  Created by guille on 24/05/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGContributorTests : SenTestCase

@property (strong, nonatomic) GIGContributor *contributor;

@end

@implementation GIGContributorTests

- (void)setUp {
    [super setUp];

    NSDictionary *representation = @{
            @"id" : @819797,
            @"screen_name" : @"episod"
    };

    self.contributor = [MTLJSONAdapter modelOfClass:GIGContributor.class fromJSONDictionary:representation error:NULL];
}

- (void)tearDown {
    self.contributor = nil;
    [super tearDown];
}

- (void)testThatContributorExists {
    STAssertNotNil(self.contributor, nil);
}

- (void)testThatContributorInitializes {
    STAssertEqualObjects(self.contributor.userID, @819797, nil);
    STAssertEqualObjects(self.contributor.screenName, @"episod", nil);
}

@end
