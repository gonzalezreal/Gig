//
//  GIGClientTests.m
//  Gig
//
//  Created by guille on 11/09/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGClientTests : SenTestCase

@property (strong, nonatomic) GIGClient *client;

@end

@implementation GIGClientTests

- (void)setUp {
    [super setUp];

    self.client = [[GIGClient alloc] initWithAccount:nil defaultParameters:nil];
    self.client.serviceType = SLServiceTypeTwitter;
}

- (void)tearDown {
    self.client = nil;
    [super tearDown];
}

- (void)testConstants {
    STAssertEqualObjects(GIGCountKey, @"count", nil);
    STAssertEqualObjects(GIGSinceIDKey, @"since_id", nil);
    STAssertEqualObjects(GIGMaxIDKey, @"max_id", nil);
    STAssertEqualObjects(GIGTrimUserKey, @"trim_user", nil);
    STAssertEqualObjects(GIGIncludeEntitiesKey, @"include_entities", nil);
    STAssertEqualObjects(GIGIncludeUserEntitiesKey, @"include_user_entities", nil);
    STAssertEqualObjects(GIGUserIDKey, @"user_id", nil);
    STAssertEqualObjects(GIGScreenNameKey, @"screen_name", nil);
    STAssertEqualObjects(GIGExcludeRepliesKey, @"exclude_replies", nil);
    STAssertEqualObjects(GIGIncludeRetweetsKey, @"include_rts", nil);

    STAssertEqualObjects(GIGInReplyToStatusIDKey, @"in_reply_to_status_id", nil);
    STAssertEqualObjects(GIGLatitudeKey, @"lat", nil);
    STAssertEqualObjects(GIGLongitudeKey, @"long", nil);
    STAssertEqualObjects(GIGPlaceIDKey, @"place_id", nil);
    STAssertEqualObjects(GIGDisplayCoordinatesKey, @"display_coordinates", nil);
}

- (void)testFetchTimeline {
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/home_timeline.json?count=2"];
    id requestHandler = [self addRequestHandlerForHTTPMethod:@"GET" url:url responseFilename:@"statuses_home_timeline.json"];

    NSArray * __block blockTweets = nil;
    NSError * __block blockError = nil;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    OVCRequestOperation *operation = [self.client fetchTimeline:GIGTimelineHome parameters:@{
            GIGCountKey : @2
    } completion:^(NSArray *tweets, NSError *error) {
        blockTweets = tweets;
        blockError = error;
        dispatch_semaphore_signal(semaphore);
    }];

    BOOL timeout = [self waitForSemaphore:semaphore timeout:5];
    STAssertFalse(timeout, @"Timeout waiting for processing queue");

    STAssertNotNil(operation, nil);
    STAssertNil(blockError, nil);

    STAssertEquals(blockTweets.count, (NSUInteger)2, nil);
    STAssertTrue([blockTweets[0] isKindOfClass:GIGTweet.class], nil);

    [OHHTTPStubs removeRequestHandler:requestHandler];
}

- (void)testFetchRetweets {
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/retweets/21947795900469248.json?count=2"];
    id requestHandler = [self addRequestHandlerForHTTPMethod:@"GET" url:url responseFilename:@"statuses_retweets.json"];

    NSArray * __block blockTweets = nil;
    NSError * __block blockError = nil;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    OVCRequestOperation *operation = [self.client fetchRetweetsForStatus:@21947795900469248 parameters:@{
            GIGCountKey : @2
    }                                                         completion:^(NSArray *tweets, NSError *error) {
        blockTweets = tweets;
        blockError = error;
        dispatch_semaphore_signal(semaphore);
    }];

    BOOL timeout = [self waitForSemaphore:semaphore timeout:5];
    STAssertFalse(timeout, @"Timeout waiting for processing queue");

    STAssertNotNil(operation, nil);
    STAssertNil(blockError, nil);

    STAssertEquals(blockTweets.count, (NSUInteger)2, nil);
    STAssertTrue([blockTweets[0] isKindOfClass:GIGTweet.class], nil);

    [OHHTTPStubs removeRequestHandler:requestHandler];
}

- (void)testFetchStatus {
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/show/210462857140252672.json"];
    id requestHandler = [self addRequestHandlerForHTTPMethod:@"GET" url:url responseFilename:@"statuses_show.json"];

    GIGTweet * __block blockTweet = nil;
    NSError * __block blockError = nil;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    OVCRequestOperation *operation = [self.client fetchStatus:@210462857140252672 parameters:nil completion:^(GIGTweet *tweet, NSError *error) {
        blockTweet = tweet;
        blockError = error;
        dispatch_semaphore_signal(semaphore);
    }];

    BOOL timeout = [self waitForSemaphore:semaphore timeout:5];
    STAssertFalse(timeout, @"Timeout waiting for processing queue");

    STAssertNotNil(operation, nil);
    STAssertNil(blockError, nil);

    STAssertTrue([blockTweet isKindOfClass:GIGTweet.class], nil);
    STAssertEqualObjects(blockTweet.statusID, @210462857140252672, nil);

    [OHHTTPStubs removeRequestHandler:requestHandler];
}

- (void)testRemoveStatus {
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/destroy/240854986559455234.json"];
    id requestHandler = [self addRequestHandlerForHTTPMethod:@"POST" url:url responseFilename:@"statuses_destroy.json"];

    GIGTweet * __block blockTweet = nil;
    NSError * __block blockError = nil;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    OVCRequestOperation *operation = [self.client removeStatus:@240854986559455234 parameters:nil completion:^(GIGTweet *tweet, NSError *error) {
        blockTweet = tweet;
        blockError = error;
        dispatch_semaphore_signal(semaphore);
    }];

    BOOL timeout = [self waitForSemaphore:semaphore timeout:5];
    STAssertFalse(timeout, @"Timeout waiting for processing queue");

    STAssertNotNil(operation, nil);
    STAssertNil(blockError, nil);

    STAssertTrue([blockTweet isKindOfClass:GIGTweet.class], nil);
    STAssertEqualObjects(blockTweet.statusID, @240854986559455234, nil);

    [OHHTTPStubs removeRequestHandler:requestHandler];
}

- (void)testUpdateStatus {
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/update.json"];
    id requestHandler = [self addRequestHandlerForHTTPMethod:@"POST" url:url responseFilename:@"statuses_update.json"];

    GIGTweet * __block blockTweet = nil;
    NSError * __block blockError = nil;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    OVCRequestOperation *operation = [self.client updateStatusWithText:@"Maybe he'll finally find his keys. #peterfalk" parameters:nil completion:^(GIGTweet *tweet, NSError *error) {
        blockTweet = tweet;
        blockError = error;
        dispatch_semaphore_signal(semaphore);
    }];

    BOOL timeout = [self waitForSemaphore:semaphore timeout:5];
    STAssertFalse(timeout, @"Timeout waiting for processing queue");

    STAssertNotNil(operation, nil);
    STAssertNil(blockError, nil);

    STAssertTrue([blockTweet isKindOfClass:GIGTweet.class], nil);
    STAssertEqualObjects(blockTweet.statusID, @243145735212777472, nil);

    [OHHTTPStubs removeRequestHandler:requestHandler];
}

- (void)testRetweetStatus {
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/retweet/241259202004267009.json"];
    id requestHandler = [self addRequestHandlerForHTTPMethod:@"POST" url:url responseFilename:@"statuses_retweet.json"];

    GIGTweet * __block blockTweet = nil;
    NSError * __block blockError = nil;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    OVCRequestOperation *operation = [self.client retweetStatus:@241259202004267009 parameters:nil completion:^(GIGTweet *tweet, NSError *error) {
        blockTweet = tweet;
        blockError = error;
        dispatch_semaphore_signal(semaphore);
    }];

    BOOL timeout = [self waitForSemaphore:semaphore timeout:5];
    STAssertFalse(timeout, @"Timeout waiting for processing queue");

    STAssertNotNil(operation, nil);
    STAssertNil(blockError, nil);

    STAssertTrue([blockTweet isKindOfClass:GIGTweet.class], nil);
    STAssertEqualObjects(blockTweet.statusID, @243149503589400576, nil);

    [OHHTTPStubs removeRequestHandler:requestHandler];
}

- (id)addRequestHandlerForHTTPMethod:(NSString *)HTTPmethod url:(NSURL *)url responseFilename:(NSString *)filename {
    return [OHHTTPStubs addRequestHandler:^OHHTTPStubsResponse *(NSURLRequest *request, BOOL onlyCheck) {
        if (![request.HTTPMethod isEqualToString:HTTPmethod] || ![request.URL isEqual:url]) {
            return nil;
        }

        NSURL *fileURL = [[NSBundle bundleForClass:self.class] URLForResource:filename.stringByDeletingPathExtension withExtension:filename.pathExtension];
        return [OHHTTPStubsResponse responseWithFileURL:fileURL contentType:@"application/json" responseTime:0];
    }];
}

- (BOOL)waitForSemaphore:(dispatch_semaphore_t)semaphore timeout:(NSTimeInterval)timeout {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:timeout];

    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW)) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:date];

        if ([date timeIntervalSinceNow] < 0.0) {
            return YES;
        }
    }

    return NO;
}

@end