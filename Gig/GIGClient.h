// GIGClient.h
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

#import <Overcoat/Overcoat.h>

extern NSString * const GIGCountKey;
extern NSString * const GIGSinceIDKey;
extern NSString * const GIGMaxIDKey;
extern NSString * const GIGTrimUserKey;
extern NSString * const GIGIncludeEntitiesKey;
extern NSString * const GIGIncludeUserEntitiesKey;
extern NSString * const GIGUserIDKey;
extern NSString * const GIGScreenNameKey;
extern NSString * const GIGExcludeRepliesKey;
extern NSString * const GIGIncludeRetweetsKey;

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

// The different timelines that can be found on Twitter.
//
// GIGTimelineMentions     - Mentions for the authenticating user.
// GIGTimelineUser         - Tweets posted by a specific user.
// GIGTimelineHome         - Tweets and retweets posted by the authenticating user and the users they follow.
// GIGTimelineRetweetsOfMe - Tweets authored by the authenticating user that have been retweeted by others.
typedef NS_ENUM(NSInteger, GIGTimeline) {
    GIGTimelineMentions,
    GIGTimelineUser,
    GIGTimelineHome,
    GIGTimelineRetweetsOfMe
};

@interface GIGClient (Timelines)

// Fetches a collection of tweets, ordered with the most recent first.
//
// timeline   - The type of timeline. See `GIGTimeline`.
// parameters - The parameters for the request. See https://dev.twitter.com/docs/api/1.1.
// completion - A block to be executed when the operation finishes.
//
// See https://dev.twitter.com/docs/working-with-timelines
- (OVCRequestOperation *)fetchTimeline:(GIGTimeline)timeline
                            parameters:(NSDictionary *)parameters
                            completion:(void (^)(NSArray *tweets, NSError *error))completion;

@end

@interface GIGClient (Tweets)

// Fetches a collection of the 100 most recent retweets of the specified tweet.
//
// statusID   - The ID of the desired tweet.
// parameters - The parameters for the request.
// completion - A block to be executed when the operation finishes.
//
// See https://dev.twitter.com/docs/api/1.1/get/statuses/retweets/%3Aid
- (OVCRequestOperation *)fetchRetweetsForStatus:(NSNumber *)statusID
                                     parameters:(NSDictionary *)parameters
                                     completion:(void (^)(NSArray *tweets, NSError *error))completion;

@end
