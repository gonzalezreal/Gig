//
//  GIGMediaTests.m
//  Gig
//
//  Created by guille on 22/05/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGMediaTests : SenTestCase

@property (strong, nonatomic) GIGMedia *media;

@end

@implementation GIGMediaTests

- (void)setUp {
    [super setUp];

    NSDictionary *representation = @{
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
    };

    self.media = [MTLJSONAdapter modelOfClass:GIGMedia.class fromJSONDictionary:representation error:NULL];
}

- (void)tearDown {
    self.media = nil;
    [super tearDown];
}

- (void)testThatMediaExists {
    STAssertNotNil(self.media, nil);
}

- (void)testThatMediaInitializes {
    STAssertEqualObjects(self.media.mediaID, @114080493040967680, nil);
    STAssertEqualObjects(self.media.sourceStatusID, @205282515685081088, nil);
    STAssertEqualObjects(self.media.type, @"photo", nil);
    STAssertEquals(self.media.range, NSMakeRange(15, 35), nil);
    STAssertEqualObjects(self.media.URL, [NSURL URLWithString:@"http://t.co/rJC5Pxsu"], nil);
    STAssertEqualObjects(self.media.displayURL, @"pic.twitter.com/rJC5Pxsu", nil);
    STAssertEqualObjects(self.media.expandedURL, [NSURL URLWithString:@"http://twitter.com/yunorno/status/114080493036773378/photo/1"], nil);
    STAssertEqualObjects(self.media.mediaURL, [NSURL URLWithString:@"http://p.twimg.com/AZVLmp-CIAAbkyy.jpg"], nil);
    STAssertEqualObjects(self.media.secureMediaURL, [NSURL URLWithString:@"https://p.twimg.com/AZVLmp-CIAAbkyy.jpg"], nil);

    STAssertTrue([self.media.sizes isKindOfClass:GIGSizes.class], nil);
    STAssertEquals(self.media.sizes.thumbnail.CGSize, CGSizeMake(150, 150), nil);
    STAssertEqualObjects(self.media.sizes.thumbnail.resizingMethod, @"crop", nil);
}

@end
