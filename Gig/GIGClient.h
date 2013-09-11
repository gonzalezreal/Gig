//
//  GIGClient.h
//  Gig
//
//  Created by guille on 11/09/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

#import <Overcoat/Overcoat.h>

extern NSString * const GIGMentionsTimeline;
extern NSString * const GIGUserTimeline;
extern NSString * const GIGHomeTimeline;
extern NSString * const GIGRetweetsOfMe;

extern NSString * const GIGCountKey;
extern NSString * const GIGSinceIDKey;
extern NSString * const GIGMaxIDKey;
extern NSString * const GIGTrimUserKey;
extern NSString * const GIGContributorDetailsKey;
extern NSString * const GIGIncludeEntitiesKey;

// Twitter API client.
@interface GIGClient : OVCSocialClient

// Default parameters that will be sent with each request.
@property (copy, nonatomic, readonly) NSDictionary *defaultParameters;

// Initializes a `GIGClient`with the specified account and default parameters.
//
// account           - The user account that will be used to sign each request.
// defaultParameters - The parameters that will be sent with each request.
- (id)initWithAccount:(ACAccount *)account defaultParameters:(NSDictionary *)defaultParameters;

@end

@interface GIGClient (Timelines)

// Fetches a collection of tweets, ordered with the most recent first.
//
// timeline   - The name of the timeline. You can use any of these constants: `GIGMentionsTimeline`,
//              `GIGUserTimeline`, `GIGHomeTimeline` and `GIGRetweetsOfMe`.
// parameters - The parameters for the request. See https://dev.twitter.com/docs/api/1.1.
// completion - A block to be executed when the operation finishes.
//
// See https://dev.twitter.com/docs/working-with-timelines
- (OVCRequestOperation *)fetchTimeline:(NSString *)timeline
                            parameters:(NSDictionary *)parameters
                            completion:(void (^)(NSArray *tweets, NSError *error))completion;

@end
