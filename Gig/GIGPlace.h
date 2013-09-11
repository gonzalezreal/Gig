// GIGPlace.h
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

// Geo Place Attributes
//
// Place Attributes are metadata about places and allow any user or application to add
// arbitrary metadata to a place. An attribute is a key-value pair of arbitrary strings,
// but with some conventions.

// Well-known attributes
//
// There are a number of well-known place attributes which may, or may not exist in the
// returned data. These attributes are provided when the place was created in the Twitter
// places database.

// Street address.
extern NSString * const GIGPlaceAttributeStreetAddressKey;

// The city the place is in.
extern NSString * const GIGPlaceAttributeLocalityKey;

// The administrative region the place is in.
extern NSString * const GIGPlaceAttributeRegionKey;

// The country code.
extern NSString * const GIGPlaceAttributeCountryCodeKey;

// The postal code in the preferred local format for the place.
extern NSString * const GIGPlaceAttributePostalCodeKey;

// The phone number in the preferred local format for the place, include long distance code.
extern NSString * const GIGPlaceAttributePhoneKey;

// The Twitter screen-name, without the '@' character.
extern NSString * const GIGPlaceAttributeTwitterKey;

// The official/canonical URL for the place.
extern NSString * const GIGPlaceAttributeURLKey;

// Places are specific, named locations with corresponding geo coordinates.
@interface GIGPlace : MTLModel <MTLJSONSerializing>

// ID representing this place.
@property (copy, nonatomic, readonly) NSString *placeID;

// Variant information about the place. See attribute constants.
@property (copy, nonatomic, readonly) NSDictionary *attributes;

// A bounding box of coordinates which encloses this place.
@property (strong, nonatomic, readonly) GIGGeometry *boundingBox;

// Name of the country containing this place.
@property (copy, nonatomic, readonly) NSString *country;

// Shortened country code representing the country containing this place.
@property (copy, nonatomic, readonly) NSString *countryCode;

// Full human-readable representation of the place's name.
@property (copy, nonatomic, readonly) NSString *fullName;

// Short human-readable representation of the place's name.
@property (copy, nonatomic, readonly) NSString *name;

// The type of location represented by this place.
@property (copy, nonatomic, readonly) NSString *placeType;

// URL representing the location of additional place metadata for this place.
@property (copy, nonatomic, readonly) NSURL *URL;

@end
