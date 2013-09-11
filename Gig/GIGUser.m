// GIGUser.m
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

#import "GIGUser.h"
#import "GIGTweet.h"
#import "GIGUserEntities.h"

#import "NSValueTransformer+GIGPredefinedTransformerAdditions.h"

@implementation GIGUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"userID" : @"id",
            @"contributorsEnabled" : @"contributors_enabled",
            @"creationDate" : @"created_at",
            @"defaultProfile" : @"default_profile",
            @"defaultProfileImage" : @"default_profile_image",
            @"about" : @"description",
            @"favoritesCount" : @"favourites_count",
            @"followRequestSent" : @"follow_request_sent",
            @"followersCount" : @"followers_count",
            @"friendsCount" : @"friends_count",
            @"geoEnabled" : @"geo_enabled",
            @"isTranslator" : @"is_translator",
            @"language" : @"lang",
            @"listedCount" : @"listed_count",
            @"profileBackgroundColor" : @"profile_background_color",
            @"profileBackgroundImageURL" : @"profile_background_image_url",
            @"secureProfileBackgroundImageURL" : @"profile_background_image_url_https",
            @"profileBackgroundTile" : @"profile_background_tile",
            @"profileBannerURL" : @"profile_banner_url",
            @"profileImageURL" : @"profile_image_url",
            @"secureProfileImageURL" : @"profile_image_url_https",
            @"profileLinkColor" : @"profile_link_color",
            @"profileSidebarBorderColor" : @"profile_sidebar_border_color",
            @"profileSidebarFillColor" : @"profile_sidebar_fill_color",
            @"profileTextColor" : @"profile_text_color",
            @"profileUseBackgroundImage" : @"profile_use_background_image",
            @"screenName" : @"screen_name",
            @"statusesCount" : @"statuses_count",
            @"timeZone" : @"time_zone",
            @"URL" : @"url",
            @"secondsFromGMT" : @"utc_offset",
            @"withheldInCountries" : @"withheld_in_countries",
            @"withheldScope" : @"withheld_scope"
    };
}

+ (NSValueTransformer *)contributorsEnabledJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [NSValueTransformer valueTransformerForName:GIGDateValueTransformerName];
}

+ (NSValueTransformer *)defaultProfileJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)defaultProfileImageJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:GIGUserEntities.class];
}

+ (NSValueTransformer *)profileBackgroundColorJSONTransformer {
    return [NSValueTransformer valueTransformerForName:GIGColorValueTransformerName];
}

+ (NSValueTransformer *)followRequestSentJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)followingJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)geoEnabledJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)isTranslatorJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)profileBackgroundImageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)secureProfileBackgroundImageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)profileBackgroundTileJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)profileBannerURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)profileImageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)secureProfileImageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)profileLinkColorJSONTransformer {
    return [NSValueTransformer valueTransformerForName:GIGColorValueTransformerName];
}

+ (NSValueTransformer *)profileSidebarBorderColorJSONTransformer {
    return [NSValueTransformer valueTransformerForName:GIGColorValueTransformerName];
}

+ (NSValueTransformer *)profileSidebarFillColorJSONTransformer {
    return [NSValueTransformer valueTransformerForName:GIGColorValueTransformerName];
}

+ (NSValueTransformer *)profileTextColorJSONTransformer {
    return [NSValueTransformer valueTransformerForName:GIGColorValueTransformerName];
}

+ (NSValueTransformer *)profileUseBackgroundImageJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)protectedJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:GIGTweet.class];
}

+ (NSValueTransformer *)URLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)verifiedJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

@end
