//
//  GIGPlaceTests.m
//  Gig
//
//  Created by guille on 23/05/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGPlaceTests : SenTestCase

@property (strong, nonatomic) GIGPlace *place;

@end

@implementation GIGPlaceTests

- (void)setUp {
    [super setUp];

    NSDictionary *representation = @{
            @"id" : @"7238f93a3e899af6",
            @"attributes" : @{
                    @"street_address" : @"795 Folsom St",
                    @"623:id" : @"210176",
                    @"twitter" : @"twitter"
            },
            @"bounding_box" : @{
                    @"coordinates" : @[
                            @[
                                    @[@2.2241006, @48.8155414],
                                    @[@2.4699099, @48.8155414],
                                    @[@2.4699099, @48.9021461],
                                    @[@2.2241006, @48.9021461]
                            ]
                    ],
                    @"type" : @"Polygon"
            },
            @"country" : @"France",
            @"country_code" : @"FR",
            @"full_name" : @"Paris, Paris",
            @"name" : @"Paris",
            @"place_type": @"city",
            @"url" : @"http://api.twitter.com/1/geo/id/7238f93a3e899af6.json"
    };

    self.place = [MTLJSONAdapter modelOfClass:GIGPlace.class fromJSONDictionary:representation error:NULL];
}

- (void)tearDown {
    self.place = nil;
    [super tearDown];
}

- (void)testThatPlaceExists {
    STAssertNotNil(self.place, nil);
}

- (void)testStreetAddressAttributeKey {
    STAssertEqualObjects(GIGPlaceAttributeStreetAddressKey, @"street_address", nil);
}

- (void)testLocalityAttributeKey {
    STAssertEqualObjects(GIGPlaceAttributeLocalityKey, @"locality", nil);
}

- (void)testRegionAttributeKey {
    STAssertEqualObjects(GIGPlaceAttributeRegionKey, @"region", nil);
}

- (void)testCountryCodeAttributeKey {
    STAssertEqualObjects(GIGPlaceAttributeCountryCodeKey, @"iso3", nil);
}

- (void)testPostalCodeAttributeKey {
    STAssertEqualObjects(GIGPlaceAttributePostalCodeKey, @"postal_code", nil);
}

- (void)testPhoneAttributeKey {
    STAssertEqualObjects(GIGPlaceAttributePhoneKey, @"phone", nil);
}

- (void)testTwitterAttributeKey {
    STAssertEqualObjects(GIGPlaceAttributeTwitterKey, @"twitter", nil);
}

- (void)testURLAttributeKey {
    STAssertEqualObjects(GIGPlaceAttributeURLKey, @"url", nil);
}

- (void)testThatPlaceInitializes {
    STAssertEqualObjects(self.place.placeID, @"7238f93a3e899af6", nil);

    NSDictionary *attributes = @{
            @"street_address" : @"795 Folsom St",
            @"623:id" : @"210176",
            @"twitter" : @"twitter"
    };
    STAssertEqualObjects(self.place.attributes, attributes, nil);

    STAssertTrue([self.place.boundingBox isKindOfClass:GIGGeometry.class], nil);
    STAssertEqualObjects(self.place.boundingBox.type, @"Polygon", nil);

    STAssertEqualObjects(self.place.country, @"France", nil);
    STAssertEqualObjects(self.place.countryCode, @"FR", nil);
    STAssertEqualObjects(self.place.fullName, @"Paris, Paris", nil);
    STAssertEqualObjects(self.place.name, @"Paris", nil);
    STAssertEqualObjects(self.place.placeType, @"city", nil);
    STAssertEqualObjects(self.place.URL, [NSURL URLWithString:@"http://api.twitter.com/1/geo/id/7238f93a3e899af6.json"], nil);
}

@end
