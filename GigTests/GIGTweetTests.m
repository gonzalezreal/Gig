 //
//  GIGTweetTests.m
//  Gig
//
//  Created by guille on 24/05/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGTweetTests : SenTestCase

@property (strong, nonatomic) GIGTweet *tweet;

@end

@implementation GIGTweetTests

- (void)setUp {
    [super setUp];

    NSDictionary *representation = @{
            @"id_str" : @"114749583439036416",
            @"coordinates" : @{
                    @"coordinates" : @[@-75.14310264, @40.05701649],
                    @"type" : @"Point"
            },
            @"created_at" : @"Wed Aug 27 13:08:45 +0000 2008",
            @"current_user_retweet": @{
                    @"id_str": @"26815871309"
            },
            @"entities" : @{
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
            },
            @"favorite_count" : @1138,
            @"favorited" : @YES,
            @"filter_level" : @"medium",
            @"in_reply_to_screen_name" : @"twitterapi",
            @"in_reply_to_status_id_str" : @"114749583439036416",
            @"in_reply_to_user_id" : @819797,
            @"lang" : @"en",
            @"place" : @{
                    @"bounding_box" : @{
                            @"coordinates" : @[
                                    @[
                                            @[@-77.119759, @38.791645],
                                            @[@-76.909393, @38.791645],
                                            @[@-76.909393, @38.995548],
                                            @[@-77.119759, @38.995548]
                                    ]
                            ],
                            @"type" : @"Polygon"
                    },
                    @"country" : @"United States",
                    @"country_code" : @"US",
                    @"full_name" : @"Washington, DC",
                    @"id" : @"01fbe706f872cb32",
                    @"name" : @"Washington",
                    @"place_type" : @"city",
                    @"url" : @"http://api.twitter.com/1/geo/id/01fbe706f872cb32.json"
            },
            @"possibly_sensitive" : @YES,
            @"scopes" : @{
                    @"followers": @NO
            },
            @"retweet_count" : @1585,
            @"retweeted" : @YES,
            @"retweeted_status" : @{
                    @"text" : @"Tweet Button, Follow Button, and Web Intents javascript now support SSL http://t.co/9fbA0oYy ^TS",
                    @"id_str" : @"21947795900469248"
            },
            @"source" : @"web",
            @"text" : @"Tweet Button, Follow Button, and Web Intents javascript now support SSL http://t.co/9fbA0oYy ^TS",
            @"truncated" : @YES,
            @"user" : @{
                    @"id" : @6253282
            },
            @"withheld_copyright" : @YES,
            @"withheld_in_countries" : @[@"GR", @"HK", @"MY"],
            @"withheld_scope" : @"status"
    };

    self.tweet = [MTLJSONAdapter modelOfClass:GIGTweet.class fromJSONDictionary:representation error:NULL];
}

- (void)tearDown {
    self.tweet = nil;
    [super tearDown];
}

- (void)testThatTweetExists {
    STAssertNotNil(self.tweet, nil);
}

- (void)testThatTweetInitializes {
    STAssertEqualObjects(self.tweet.statusID, @114749583439036416, nil);

    GIGGeometry *coordinates = self.tweet.coordinates;
    STAssertEqualObjects(coordinates.coordinates, (@[@-75.14310264, @40.05701649]), nil);

    NSValueTransformer *transformer = [NSValueTransformer valueTransformerForName:GIGDateValueTransformerName];
    NSDate *creationDate = [transformer transformedValue:@"Wed Aug 27 13:08:45 +0000 2008"];
    STAssertEqualObjects(self.tweet.creationDate, creationDate, nil);

    STAssertEqualObjects(self.tweet.currentUserRetweetID, @26815871309, nil);

    STAssertTrue([self.tweet.entities isKindOfClass:GIGEntities.class], nil);

    STAssertEqualObjects(self.tweet.favoriteCount, @1138, nil);

    STAssertEqualObjects(self.tweet.favorited, @YES, nil);

    STAssertEqualObjects(self.tweet.filterLevel, @"medium", nil);

    STAssertEqualObjects(self.tweet.inReplyToScreenName, @"twitterapi", nil);

    STAssertEqualObjects(self.tweet.inReplyToStatusID, @114749583439036416, nil);

    STAssertEqualObjects(self.tweet.inReplyToUserID, @819797, nil);

    STAssertEqualObjects(self.tweet.language, @"en", nil);

    STAssertTrue([self.tweet.place isKindOfClass:GIGPlace.class], nil);
    STAssertEqualObjects(self.tweet.place.placeID, @"01fbe706f872cb32", nil);

    STAssertEqualObjects(self.tweet.possiblySensitive, @YES, nil);

    STAssertEqualObjects(self.tweet.scopes, @{@"followers" : @NO}, nil);

    STAssertEqualObjects(self.tweet.retweetCount, @1585, nil);

    STAssertEqualObjects(self.tweet.retweeted, @YES, nil);

    STAssertTrue([self.tweet.retweetedStatus isKindOfClass:GIGTweet.class], nil);
    STAssertEqualObjects(self.tweet.retweetedStatus.statusID, @21947795900469248, nil);

    STAssertEqualObjects(self.tweet.source, @"web", nil);

    STAssertEqualObjects(self.tweet.text, @"Tweet Button, Follow Button, and Web Intents javascript now support SSL http://t.co/9fbA0oYy ^TS", nil);

    STAssertEqualObjects(self.tweet.truncated, @YES, nil);

    STAssertTrue([self.tweet.user isKindOfClass:GIGUser.class], nil);
    STAssertEqualObjects(self.tweet.user.userID, @6253282, nil);

    STAssertEqualObjects(self.tweet.withheldCopyright, @YES, nil);

    STAssertEqualObjects(self.tweet.withheldInCountries, (@[@"GR", @"HK", @"MY"]), nil);

    STAssertEqualObjects(self.tweet.withheldScope, @"status", nil);
}

@end
