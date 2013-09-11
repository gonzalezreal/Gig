//
//  GIGUserEntitiesTests.m
//  Gig
//
//  Created by guille on 11/09/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGUserEntitiesTests : SenTestCase

@property (strong, nonatomic) GIGUserEntities *entities;

@end

@implementation GIGUserEntitiesTests

- (void)setUp {
    [super setUp];

    NSDictionary *representation = @{
            @"url" : @{
                    @"urls" : @[
                            @{
                                    @"url" : @"http://dev.twitter.com",
                                    @"indices": @[@0, @22]
                            }
                    ]
            },
            @"description" : @{
                    @"urls" : @[
                            @{
                                    @"url" : @"http://twitter.com",
                                    @"indices": @[@4, @22]
                            }
                    ]
            }
    };

    self.entities = [MTLJSONAdapter modelOfClass:GIGUserEntities.class fromJSONDictionary:representation error:NULL];
}

- (void)tearDown {
    self.entities = nil;
    [super tearDown];
}

- (void)testThatEntitiesExists {
    STAssertNotNil(self.entities, nil);
}

- (void)testThatEntitiesInitializes {
    STAssertEquals(self.entities.URLs.count, (NSUInteger)1, nil);
    GIGURL *url = self.entities.URLs[0];
    STAssertEqualObjects(url.URL, [NSURL URLWithString:@"http://dev.twitter.com"], nil);

    STAssertEquals(self.entities.aboutURLs.count, (NSUInteger)1, nil);
    url = self.entities.aboutURLs[0];
    STAssertEqualObjects(url.URL, [NSURL URLWithString:@"http://twitter.com"], nil);
}

@end