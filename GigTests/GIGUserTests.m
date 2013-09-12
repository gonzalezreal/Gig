//
//  GIGUserTests.m
//  Gig
//
//  Created by guille on 24/05/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGUserTests : SenTestCase

@property (strong, nonatomic) GIGUser *user;

@end

@implementation GIGUserTests

- (void)setUp {
    [super setUp];

    NSDictionary *representation = @{
            @"id" : @6253282,
            @"created_at" : @"Mon Nov 29 21:18:15 +0000 2010",
            @"default_profile" : @NO,
            @"default_profile_image" : @NO,
            @"description" : @"The Real Twitter API.",
            @"entities" : @{
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
            },
            @"favourites_count" : @13,
            @"follow_request_sent" : @NO,
            @"following" : @YES,
            @"followers_count" : @21,
            @"friends_count" : @32,
            @"geo_enabled" : @YES,
            @"is_translator" : @NO,
            @"lang" : @"en",
            @"listed_count" : @9274,
            @"location" : @"San Francisco, CA",
            @"name" : @"Twitter API",
            @"profile_background_color" : @"e8f2f7",
            @"profile_background_image_url" : @"http://a2.twimg.com/profile_background_images/229557229/twitterapi-bg.png",
            @"profile_background_image_url_https" : @"https://a2.twimg.com/profile_background_images/229557229/twitterapi-bg.png",
            @"profile_background_tile" : @NO,
            @"profile_banner_url" : @"https://si0.twimg.com/profile_banners/819797/1348102824",
            @"profile_image_url" : @"http://a2.twimg.com/profile_images/1438634086/avatar_normal.png",
            @"profile_image_url_https" : @"https://a2.twimg.com/profile_images/1438634086/avatar_normal.png",
            @"profile_link_color" : @"0094C2",
            @"profile_sidebar_border_color" : @"0094C2",
            @"profile_sidebar_fill_color" : @"a9d9f1",
            @"profile_text_color" : @"437792",
            @"profile_use_background_image" : @YES,
            @"protected" : @YES,
            @"screen_name" : @"twitterapi",
            @"status" : @{
                    @"favorited" : @NO,
                    @"truncated" : @NO,
                    @"created_at" : @"Tue Apr 17 16:38:18 +0000 2012",
                    @"entities" : @{
                            @"user_mentions" : @[
                                    @{
                                            @"name" : @"Micah McVicker",
                                            @"id" : @166661446,
                                            @"indices" : @[@0, @14],
                                            @"screen_name" : @"MicahMcVicker"
                                    }
                            ]
                    },
                    @"text" : @"@MicahMcVicker make sure you're using include_rts=true and no other filters, then walking your timeline by since_id and max_id",
                    @"retweet_count" : @0,
                    @"id_str" : @"192290904646754304",
                    @"retweeted" : @NO,
                    @"in_reply_to_user_id" : @166661446,
                    @"in_reply_to_screen_name" : @"MicahMcVicker",
                    @"source": @"<a href=\"http://sites.google.com/site/yorufukurou/\" rel=\"nofollow\">YoruFukurou</a>",
                    @"in_reply_to_status_id_str": @"192290470427246594"
            },
            @"statuses_count" : @42,
            @"time_zone" : @"Pacific Time (US & Canada)",
            @"url" : @"http://dev.twitter.com",
            @"utc_offset" : @-18000,
            @"verified" : @NO,
            @"withheld_in_countries" : @"GR, HK, MY",
            @"withheld_scope" : @"user"
    };

    self.user = [MTLJSONAdapter modelOfClass:GIGUser.class fromJSONDictionary:representation error:NULL];
}

- (void)tearDown {
    self.user = nil;
    [super tearDown];
}

- (void)testThatUserExists {
    STAssertNotNil(self.user, nil);
}

- (void)testThatUserInitializes {
    STAssertEqualObjects(self.user.userID, @6253282, nil);

    NSValueTransformer *dateTransformer = [NSValueTransformer valueTransformerForName:GIGDateValueTransformerName];
    NSDate *creationDate = [dateTransformer transformedValue:@"Mon Nov 29 21:18:15 +0000 2010"];
    STAssertEqualObjects(self.user.creationDate, creationDate, nil);

    STAssertEqualObjects(self.user.defaultProfile, @NO, nil);

    STAssertEqualObjects(self.user.defaultProfileImage, @NO, nil);

    STAssertEqualObjects(self.user.about, @"The Real Twitter API.", nil);

    STAssertTrue([self.user.entities isKindOfClass:GIGUserEntities.class], nil);

    STAssertEqualObjects(self.user.favoritesCount, @13, nil);

    STAssertEqualObjects(self.user.followRequestSent, @NO, nil);

    STAssertEqualObjects(self.user.following, @YES, nil);

    STAssertEqualObjects(self.user.followersCount, @21, nil);

    STAssertEqualObjects(self.user.friendsCount, @32, nil);

    STAssertEqualObjects(self.user.geoEnabled, @YES, nil);

    STAssertEqualObjects(self.user.isTranslator, @NO, nil);

    STAssertEqualObjects(self.user.language, @"en", nil);

    STAssertEqualObjects(self.user.listedCount, @9274, nil);

    STAssertEqualObjects(self.user.location, @"San Francisco, CA", nil);

    STAssertEqualObjects(self.user.name, @"Twitter API", nil);

    NSValueTransformer *colorTransformer = [NSValueTransformer valueTransformerForName:GIGColorValueTransformerName];
    id profileBackgroundColor = [colorTransformer transformedValue:@"e8f2f7"];
    STAssertEqualObjects(self.user.profileBackgroundColor, profileBackgroundColor, nil);

    STAssertEqualObjects(self.user.profileBackgroundImageURL, [NSURL URLWithString:@"http://a2.twimg.com/profile_background_images/229557229/twitterapi-bg.png"], nil);

    STAssertEqualObjects(self.user.secureProfileBackgroundImageURL, [NSURL URLWithString:@"https://a2.twimg.com/profile_background_images/229557229/twitterapi-bg.png"], nil);

    STAssertEqualObjects(self.user.profileBackgroundTile, @NO, nil);

    STAssertEqualObjects(self.user.profileBannerURL, [NSURL URLWithString:@"https://si0.twimg.com/profile_banners/819797/1348102824"], nil);

    STAssertEqualObjects(self.user.profileImageURL, [NSURL URLWithString:@"http://a2.twimg.com/profile_images/1438634086/avatar_normal.png"], nil);

    STAssertEqualObjects(self.user.secureProfileImageURL, [NSURL URLWithString:@"https://a2.twimg.com/profile_images/1438634086/avatar_normal.png"], nil);

    id profileLinkColor = [colorTransformer transformedValue:@"0094C2"];
    STAssertEqualObjects(self.user.profileLinkColor, profileLinkColor, nil);

    id profileSidebarBorderColor = [colorTransformer transformedValue:@"0094C2"];
    STAssertEqualObjects(self.user.profileSidebarBorderColor, profileSidebarBorderColor, nil);

    id profileSidebarFillColor = [colorTransformer transformedValue:@"a9d9f1"];
    STAssertEqualObjects(self.user.profileSidebarFillColor, profileSidebarFillColor, nil);

    id profileTextColor = [colorTransformer transformedValue:@"437792"];
    STAssertEqualObjects(self.user.profileTextColor, profileTextColor, nil);

    STAssertEqualObjects(self.user.profileUseBackgroundImage, @YES, nil);

    STAssertEqualObjects(self.user.protected, @YES, nil);

    STAssertEqualObjects(self.user.screenName, @"twitterapi", nil);

    STAssertTrue([self.user.status isKindOfClass:GIGTweet.class], nil);
    STAssertEqualObjects(self.user.status.statusID, @192290904646754304, nil);

    STAssertEqualObjects(self.user.statusesCount, @42, nil);

    STAssertEqualObjects(self.user.timeZone, @"Pacific Time (US & Canada)", nil);

    STAssertEqualObjects(self.user.URL, [NSURL URLWithString:@"http://dev.twitter.com"], nil);

    STAssertEqualObjects(self.user.secondsFromGMT, @-18000, nil);

    STAssertEqualObjects(self.user.verified, @NO, nil);

    STAssertEqualObjects(self.user.withheldInCountries, @"GR, HK, MY", nil);

    STAssertEqualObjects(self.user.withheldScope, @"user", nil);
}

@end
