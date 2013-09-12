// GIGClient.m
//
// Copyright (c) 2013 Guillermo Gonzalez
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "GIGClient.h"
#import "GIGTweet.h"

#import <Accounts/Accounts.h>

NSString * const GIGCountKey = @"count";
NSString * const GIGSinceIDKey = @"since_id";
NSString * const GIGMaxIDKey = @"max_id";
NSString * const GIGTrimUserKey = @"trim_user";
NSString * const GIGContributorDetailsKey = @"contributor_details";
NSString * const GIGIncludeEntitiesKey = @"include_entities";
NSString * const GIGIncludeUserEntitiesKey = @"include_user_entities";
NSString * const GIGUserIDKey = @"user_id";
NSString * const GIGScreenNameKey = @"screen_name";
NSString * const GIGExcludeRepliesKey = @"exclude_replies";
NSString * const GIGIncludeRetweetsKey = @"include_rts";

@implementation GIGClient

- (id)initWithAccount:(ACAccount *)account defaultParameters:(NSDictionary *)defaultParameters {
    self = [super initWithBaseURL:[NSURL URLWithString:@"https://api.twitter.com/1.1"]];

    if (self) {
        self.account = account;
        _defaultParameters = defaultParameters ? [defaultParameters copy] : @{};
    }

    return self;
}

- (NSDictionary *)requestParametersWithParameters:(NSDictionary *)parameters {
    NSDictionary *requestParameters = [self.defaultParameters mtl_dictionaryByAddingEntriesFromDictionary:parameters];
    NSMutableDictionary *transformedParameters = [NSMutableDictionary dictionaryWithCapacity:requestParameters.count];

    // Make sure all parameter values are strings
    for (id key in requestParameters) {
        transformedParameters[key] = [requestParameters[key] description];
    }

    return transformedParameters;
}

@end

@implementation GIGClient (Timelines)

- (OVCRequestOperation *)fetchTimeline:(GIGTimeline)timeline parameters:(NSDictionary *)parameters completion:(void (^)(NSArray *tweets, NSError *error))completion {
    NSParameterAssert(completion);

    static dispatch_once_t onceToken;
    static NSDictionary *timelineNames;

    dispatch_once(&onceToken, ^{
        timelineNames = @{
                @(GIGTimelineMentions) : @"mentions_timeline",
                @(GIGTimelineUser) : @"user_timeline",
                @(GIGTimelineHome) : @"home_timeline",
                @(GIGTimelineRetweetsOfMe) : @"retweets_of_me"
        };
    });

    NSString *timelineName = timelineNames[@(timeline)];
    NSString *path = [NSString stringWithFormat:@"statuses/%@.json", timelineName];
    NSDictionary *requestParameters = [self requestParametersWithParameters:parameters];

    return [self GET:path parameters:requestParameters resultClass:GIGTweet.class resultKeyPath:nil completion:^(AFHTTPRequestOperation *operation, id responseObject, NSError *error) {
        completion(responseObject, error);
    }];
}

@end