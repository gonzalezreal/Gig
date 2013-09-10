// GIGPlace.m
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

#import "GIGPlace.h"
#import "GIGGeometry.h"

NSString * const GIGPlaceAttributeStreetAddressKey = @"street_address";
NSString * const GIGPlaceAttributeLocalityKey = @"locality";
NSString * const GIGPlaceAttributeRegionKey = @"region";
NSString * const GIGPlaceAttributeCountryCodeKey = @"iso3";
NSString * const GIGPlaceAttributePostalCodeKey = @"postal_code";
NSString * const GIGPlaceAttributePhoneKey = @"phone";
NSString * const GIGPlaceAttributeTwitterKey = @"twitter";
NSString * const GIGPlaceAttributeURLKey = @"url";

@implementation GIGPlace

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"placeID" : @"id",
            @"boundingBox" : @"bounding_box",
            @"countryCode" : @"country_code",
            @"fullName" : @"full_name",
            @"placeType" : @"place_type",
            @"URL" : @"url"
    };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:GIGGeometry.class];
}

+ (NSValueTransformer *)URLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
