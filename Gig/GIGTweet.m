// GIGTweet.m
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

#import "GIGTweet.h"
#import "GIGGeometry.h"
#import "GIGEntities.h"
#import "GIGPlace.h"
#import "GIGUser.h"

#import "NSValueTransformer+GIGPredefinedTransformerAdditions.h"

@implementation GIGTweet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"statusID" : @"id",
            @"creationDate" : @"created_at",
            @"currentUserRetweetID" : @"current_user_retweet.id",
            @"favoriteCount" : @"favorite_count",
            @"filterLevel" : @"filter_level",
            @"inReplyToScreenName" : @"in_reply_to_screen_name",
            @"inReplyToStatusID" : @"in_reply_to_status_id",
            @"inReplyToUserID" : @"in_reply_to_user_id",
            @"language" : @"lang",
            @"possiblySensitive" : @"possibly_sensitive",
            @"retweetCount" : @"retweet_count",
            @"retweetedStatus" : @"retweeted_status",
            @"withheldCopyright" : @"withheld_copyright",
            @"withheldInCountries" : @"withheld_in_countries",
            @"withheldScope" : @"withheld_scope"
    };
}

+ (NSValueTransformer *)coordinatesJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:GIGGeometry.class];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [NSValueTransformer valueTransformerForName:GIGDateValueTransformerName];
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:GIGEntities.class];
}

+ (NSValueTransformer *)favoritedJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)placeJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:GIGPlace.class];
}

+ (NSValueTransformer *)possiblySensitiveJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)retweetedJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)retweetedStatusJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:self.class];
}

+ (NSValueTransformer *)truncatedJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:GIGUser.class];
}

+ (NSValueTransformer *)withheldCopyrightJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

@end
