//
//  GIGClient.m
//  Gig
//
//  Created by guille on 11/09/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

#import "GIGClient.h"
#import "GIGTweet.h"

#import <Accounts/Accounts.h>

NSString * const GIGMentionsTimeline = @"mentions_timeline";
NSString * const GIGUserTimeline = @"user_timeline";
NSString * const GIGHomeTimeline = @"home_timeline";
NSString * const GIGRetweetsOfMe = @"retweets_of_me";

NSString * const GIGCountKey = @"count";
NSString * const GIGSinceIDKey = @"since_id";
NSString * const GIGMaxIDKey = @"max_id";
NSString * const GIGTrimUserKey = @"trim_user";
NSString * const GIGContributorDetailsKey = @"contributor_details";
NSString * const GIGIncludeEntitiesKey = @"include_entities";

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

- (OVCRequestOperation *)fetchTimeline:(NSString *)timeline parameters:(NSDictionary *)parameters completion:(void (^)(NSArray *tweets, NSError *error))completion {
    NSParameterAssert(timeline != nil);
    NSParameterAssert(completion);

    NSString *path = [NSString stringWithFormat:@"statuses/%@.json", timeline];
    NSDictionary *requestParameters = [self requestParametersWithParameters:parameters];

    return [self GET:path parameters:requestParameters resultClass:GIGTweet.class resultKeyPath:nil completion:^(AFHTTPRequestOperation *operation, id responseObject, NSError *error) {
        completion(responseObject, error);
    }];
}

@end
