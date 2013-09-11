// GIGTweet.h
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

#import <Mantle/Mantle.h>

@class GIGGeometry;
@class GIGEntities;
@class GIGPlace;
@class GIGUser;

//
// Tweets are the basic atomic building block of all things Twitter. Users tweet
// Tweets, also known more generically as "status updates." Tweets can be embedded,
// replied to, favorited, unfavorited and deleted.
//
// Users can amplify the broadcast of tweets authored by other users by retweeting.
// Retweets can be distinguished from typical Tweets by the existence of a
// 'retweetedStatus' attribute. This attribute contains a representation of the
// original Tweet that was retweeted. Users can also unretweet a retweet they
// created by deleting their retweet.
//
@interface GIGTweet : MTLModel <MTLJSONSerializing>

// Unique identifier for this Tweet.
@property (copy, nonatomic, readonly) NSNumber *statusID;

// An collection of brief user objects (usually only one) indicating users who contributed
// to the authorship of the tweet, on behalf of the official tweet author.
@property (copy, nonatomic, readonly) NSArray *contributors;

// Represents the geographic location of this Tweet as reported by the user or client application.
@property (strong, nonatomic, readonly) GIGGeometry *coordinates;

// Date when this Tweet was created.
@property (copy, nonatomic, readonly) NSDate *creationDate;

// Details the Tweet ID of the user's own retweet (if existent) of this Tweet.
// Only surfaces on methods supporting the 'include_my_retweet' parameter, when set to true.
@property (copy, nonatomic, readonly) NSNumber *currentUserRetweetID;

// Entities which have been parsed out of the text of the Tweet.
@property (strong, nonatomic, readonly) GIGEntities *entities;

// Indicates approximately how many times this Tweet has been "favorited" by Twitter users.
@property (copy, nonatomic, readonly) NSNumber *favoriteCount;

// Indicates whether this Tweet has been favorited by the authenticating user.
@property (copy, nonatomic, readonly) NSNumber *favorited;

// Indicates the maximum value of the 'filter_level' parameter which may be used and still stream this Tweet.
// So a value of 'medium' will be streamed on none, low, and medium streams.
// See https://dev.twitter.com/blog/introducing-new-metadata-for-tweets for more information.
@property (copy, nonatomic, readonly) NSString *filterLevel;

// If this Tweet is a reply, this field will contain the screen name of the original Tweet author.
@property (copy, nonatomic, readonly) NSString *inReplyToScreenName;

// If this Tweet is a reply, this field will contain the original Tweet ID.
@property (copy, nonatomic, readonly) NSNumber *inReplyToStatusID;

// If this Tweet is a reply, this field will contain the original Tweet's author ID.
// This will not necessarily always be the user directly mentioned in the Tweet.
@property (copy, nonatomic, readonly) NSNumber *inReplyToUserID;

// When present, indicates a BCP 47 language identifier corresponding to the machine-detected
// language of the Tweet text, or "und" if no language could be detected.
@property (copy, nonatomic, readonly) NSString *language;

// When present, indicates that the tweet is associated (but not necessarily originating from) a Place.
@property (strong, nonatomic, readonly) GIGPlace *place;

// This field only surfaces when a tweet contains a link. The meaning of the field doesn't pertain to
// the tweet content itself, but instead it is an indicator that the URL contained in the tweet may
// contain content or media identified as sensitive content.
@property (copy, nonatomic, readonly) NSNumber *possiblySensitive;

// A set of key-value pairs indicating the intended contextual delivery of the containing Tweet.
// Currently used by Twitter's Promoted Products.
@property (copy, nonatomic, readonly) NSDictionary *scopes;

// Number of times this Tweet has been retweeted.
@property (copy, nonatomic, readonly) NSNumber *retweetCount;

// Indicates whether this Tweet has been retweeted by the authenticating user.
@property (copy, nonatomic, readonly) NSNumber *retweeted;

// Contains a representation of the original Tweet that was retweeted.
@property (strong, nonatomic, readonly) GIGTweet *retweetedStatus;

// Utility used to post the Tweet, as an HTML-formatted string.
// Tweets from the Twitter website have a source value of 'web'.
@property (copy, nonatomic, readonly) NSString *source;

// The actual text of the status update.
@property (copy, nonatomic, readonly) NSString *text;

// Indicates whether the value of the text parameter was truncated, for example,
// as a result of a retweet exceeding the 140 character Tweet length.
// Truncated text will end in ellipsis, like this ... Since Twitter now rejects
// long Tweets vs truncating them, the large majority of Tweets will have this
// set to @NO.
//
// Note that while native retweets may have their toplevel text property
// shortened, the original text will be available under the retweetedStatus
// object and the truncated parameter will be set to the value of the original
// status (in most cases, @NO).
@property (copy, nonatomic, readonly) NSNumber *truncated;

// The user who posted this Tweet.
@property (strong, nonatomic, readonly) GIGUser *user;

// When present and set to @YES, it indicates that this piece of content has been
// withheld due to a DMCA complaint.
@property (copy, nonatomic, readonly) NSNumber *withheldCopyright;

// When present, indicates a list of uppercase two-letter country codes this content
// is withheld from.
@property (copy, nonatomic, readonly) NSArray *withheldInCountries;

// When present, indicates whether the content being withheld is the 'status' or a 'user'.
@property (copy, nonatomic, readonly) NSString *withheldScope;

@end
