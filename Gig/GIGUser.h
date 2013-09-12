// GIGUser.h
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

@class GIGUserEntities;
@class GIGTweet;

#if TARGET_OS_IPHONE
    @class UIColor;
#else
    @class NSColor;
#endif

// Users can be anyone or anything. They tweet, follow, create lists, have a
// home timeline, can be mentioned, and can be looked up in bulk.
@interface GIGUser : MTLModel <MTLJSONSerializing>

// The unique identifier for this User.
@property (copy, nonatomic, readonly) NSNumber *userID;

// The date that the user account was created on Twitter.
@property (copy, nonatomic, readonly) NSDate *creationDate;

// When @YES, indicates that the user has not altered the theme or background of
// their user profile.
@property (copy, nonatomic, readonly) NSNumber *defaultProfile;

// When @YES, indicates that the user has not uploaded their own avatar and a
// default egg avatar is used instead.
@property (copy, nonatomic, readonly) NSNumber *defaultProfileImage;

// The user-defined string describing their account.
@property (copy, nonatomic, readonly) NSString *about;

// Entities which have been parsed out of the 'URL' or 'about' fields defined
// by the user.
@property (strong, nonatomic, readonly) GIGUserEntities *entities;

// The number of tweets this user has favorited in the account's lifetime.
@property (copy, nonatomic, readonly) NSNumber *favoritesCount;

// When @YES, indicates that the authenticating user has issued a follow
// request to this protected user account.
@property (copy, nonatomic, readonly) NSNumber *followRequestSent;

// Deprecated. When @YES, indicates that the authenticating user is following
// this user. Some false negatives are possible when set to @NO, but these
// false negatives are increasingly being represented as 'nil' instead.
@property (copy, nonatomic, readonly) NSNumber *following;

// The number of followers this account currently has.
@property (copy, nonatomic, readonly) NSNumber *followersCount;

// The number of users this account is following (AKA their "followings").
@property (copy, nonatomic, readonly) NSNumber *friendsCount;

// When @YES, indicates that the user has enabled the possibility of
// geo-tagging their Tweets.
@property (copy, nonatomic, readonly) NSNumber *geoEnabled;

// When true, indicates that the user is a participant in Twitter's translator
// community.
@property (copy, nonatomic, readonly) NSNumber *isTranslator;

// The BCP 47 code for the user's self-declared user interface language. May or
// may not have anything to do with the content of their Tweets.
@property (copy, nonatomic, readonly) NSString *language;

// The number of public lists that this user is a member of.
@property (copy, nonatomic, readonly) NSNumber *listedCount;

// The user-defined location for this account's profile. Not necessarily a
// location nor parseable. This field will occasionally be fuzzily
// interpreted by the Search service.
@property (copy, nonatomic, readonly) NSString *location;

// The name of the user, as they've defined it. Not necessarily a person's
// name. Typically capped at 20 characters, but subject to change.
@property (copy, nonatomic, readonly) NSString *name;

// The color chosen by the user for their background.
#if TARGET_OS_IPHONE
@property (copy, nonatomic, readonly) UIColor *profileBackgroundColor;
#else
@property (copy, nonatomic, readonly) NSColor *profileBackgroundColor;
#endif

// URL pointing to the background image the user has uploaded for their profile.
@property (copy, nonatomic, readonly) NSURL *profileBackgroundImageURL;

// HTTPS based URL pointing to the background image the user has uploaded for
// their profile.
@property (copy, nonatomic, readonly) NSURL *secureProfileBackgroundImageURL;

// When @YES, indicates that the user's profile background image should be tiled
// when displayed.
@property (copy, nonatomic, readonly) NSNumber *profileBackgroundTile;

// The HTTPS-based URL pointing to the standard web representation of the user's
// uploaded profile banner. By adding a final path element of the URL, you can
// obtain different image sizes optimized for specific displays. In the future,
// an API method will be provided to serve these URLs so that you need not modify
// the original URL.
//
// For size variations, please see https://dev.twitter.com/docs/user-profile-images-and-banners.
@property (copy, nonatomic, readonly) NSURL *profileBannerURL;

// URL pointing to the user's avatar image.
//
// For size variations, please see https://dev.twitter.com/docs/user-profile-images-and-banners.
@property (copy, nonatomic, readonly) NSURL *profileImageURL;

// HTTPS based URL pointing to the user's avatar image.
//
// For size variations, please see https://dev.twitter.com/docs/user-profile-images-and-banners.
@property (copy, nonatomic, readonly) NSURL *secureProfileImageURL;

// The color the user has chosen to display links with in their Twitter UI.
#if TARGET_OS_IPHONE
@property (copy, nonatomic, readonly) UIColor *profileLinkColor;
#else
@property (copy, nonatomic, readonly) NSColor *profileLinkColor;
#endif

// The color the user has chosen to display sidebar borders with in their Twitter UI.
#if TARGET_OS_IPHONE
@property (copy, nonatomic, readonly) UIColor *profileSidebarBorderColor;
#else
@property (copy, nonatomic, readonly) NSColor *profileSidebarBorderColor;
#endif

// The color the user has chosen to display sidebar backgrounds with in their Twitter UI.
#if TARGET_OS_IPHONE
@property (copy, nonatomic, readonly) UIColor *profileSidebarFillColor;
#else
@property (copy, nonatomic, readonly) NSColor *profileSidebarFillColor;
#endif

// The color the user has chosen to display text with in their Twitter UI.
#if TARGET_OS_IPHONE
@property (copy, nonatomic, readonly) UIColor *profileTextColor;
#else
@property (copy, nonatomic, readonly) NSColor *profileTextColor;
#endif

// When @YES, indicates the user wants their uploaded background image to be used.
@property (copy, nonatomic, readonly) NSNumber *profileUseBackgroundImage;

// When @YES, indicates that this user has chosen to protect their Tweets.
@property (copy, nonatomic, readonly) NSNumber *protected;

// The screen name, handle, or alias that this user identifies themselves with. Screen names
// are unique but subject to change. Typically a maximum of 15 characters long, but some
// historical accounts may exist with longer names.
@property (copy, nonatomic, readonly) NSString *screenName;

// If possible, the user's most recent tweet or retweet. In some circumstances, this data
// cannot be provided and this field will be omitted, null, or empty.
@property (strong, nonatomic, readonly) GIGTweet *status;

// The number of tweets (including retweets) issued by the user.
@property (copy, nonatomic, readonly) NSNumber *statusesCount;

// A string describing the Time Zone this user declares themselves within.
@property (copy, nonatomic, readonly) NSString *timeZone;

// A URL provided by the user in association with their profile.
@property (copy, nonatomic, readonly) NSURL *URL;

// The offset from GMT/UTC in seconds.
@property (copy, nonatomic, readonly) NSNumber *secondsFromGMT;

// When @YES, indicates that the user has a verified account.
@property (copy, nonatomic, readonly) NSNumber *verified;

// When present, indicates a textual representation of the two-letter country codes
// this user is withheld from.
@property (copy, nonatomic, readonly) NSString *withheldInCountries;

// When present, indicates whether the content being withheld is the "status" or a "user".
@property (copy, nonatomic, readonly) NSString *withheldScope;

@end
