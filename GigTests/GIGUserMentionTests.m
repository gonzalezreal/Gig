//
//  GIGUserMentionTests.m
//  Gig
//
//  Created by guille on 22/05/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGUserMentionTests : SenTestCase

@property (strong, nonatomic) GIGUserMention *userMention;

@end

@implementation GIGUserMentionTests

- (void)setUp {
    [super setUp];

    NSDictionary *representation = @{
            @"id" : @6253282,
            @"indices" : @[@4, @15],
            @"name" : @"Twitter API",
            @"screen_name" : @"twitterapi"
    };

    self.userMention = [MTLJSONAdapter modelOfClass:GIGUserMention.class fromJSONDictionary:representation error:NULL];
}

- (void)tearDown {
    self.userMention = nil;
    [super tearDown];
}

- (void)testThatMediaExists {
    STAssertNotNil(self.userMention, nil);
}

- (void)testThatUserMentionInitializes {
    STAssertEqualObjects(self.userMention.userID, @6253282, nil);
    STAssertEquals(self.userMention.range, NSMakeRange(4, 11), nil);
    STAssertEqualObjects(self.userMention.name, @"Twitter API", nil);
    STAssertEqualObjects(self.userMention.screenName, @"twitterapi", nil);
}

@end
