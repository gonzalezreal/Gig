//
//  GIGEntitiesTests.m
//  Gig
//
//  Created by guille on 22/05/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGEntitiesTests : SenTestCase

@property (strong, nonatomic) GIGEntities *entities;

@end

@implementation GIGEntitiesTests

- (void)setUp {
    [super setUp];

    NSDictionary *representation = @{
            @"hashtags" : @[
                    @{
                            @"indices" : @[@32, @36],
                            @"text" : @"lol"
                    }
            ],
            @"media" : @[
                    @{
                            @"id" : @114080493040967680,
                            @"source_status_id" : @205282515685081088,
                            @"type" : @"photo",
                            @"indices" : @[@15, @50],
                            @"url" : @"http://t.co/rJC5Pxsu",
                            @"display_url" : @"pic.twitter.com/rJC5Pxsu",
                            @"expanded_url" : @"http://twitter.com/yunorno/status/114080493036773378/photo/1",
                            @"media_url" : @"http://p.twimg.com/AZVLmp-CIAAbkyy.jpg",
                            @"media_url_https" : @"https://p.twimg.com/AZVLmp-CIAAbkyy.jpg",
                            @"sizes" : @{
                                @"thumb" : @{
                                        @"w" : @(150),
                                        @"h" : @(150),
                                        @"resize" : @"crop"
                                }
                            }
                    }
            ],
            @"urls" : @[
                    @{
                            @"url" : @"http://t.co/IOwBrTZR",
                            @"indices" : @[@32, @52],
                            @"display_url" : @"youtube.com/watch?v=oHg5SJ\u2026",
                            @"expanded_url" : @"http://www.youtube.com/watch?v=oHg5SJYRHA0"
                    }
            ],
            @"user_mentions" : @[
                    @{
                            @"id" : @6253282,
                            @"indices" : @[@4, @15],
                            @"name" : @"Twitter API",
                            @"screen_name" : @"twitterapi"
                    }
            ]
    };

    self.entities = [MTLJSONAdapter modelOfClass:GIGEntities.class fromJSONDictionary:representation error:NULL];
}

- (void)tearDown {
    self.entities = nil;
    [super tearDown];
}

- (void)testThatEntitiesExists {
    STAssertNotNil(self.entities, nil);
}

- (void)testThatEntitiesInitializes {
    STAssertEquals(self.entities.hashtags.count, (NSUInteger)1, nil);
    GIGHashtag *hashtag = self.entities.hashtags[0];
    STAssertEqualObjects(hashtag.text, @"lol", nil);

    STAssertEquals(self.entities.media.count, (NSUInteger)1, nil);
    GIGMedia *media = self.entities.media[0];
    STAssertEqualObjects(media.mediaID, @114080493040967680, nil);

    STAssertEquals(self.entities.URLs.count, (NSUInteger)1, nil);
    GIGURL *url = self.entities.URLs[0];
    STAssertEqualObjects(url.URL, [NSURL URLWithString:@"http://t.co/IOwBrTZR"], nil);

    STAssertEquals(self.entities.userMentions.count, (NSUInteger)1, nil);
    GIGUserMention *userMention = self.entities.userMentions[0];
    STAssertEqualObjects(userMention.userID, @6253282, nil);
}

@end
