//
//  GIGGeometryTests.m
//  Gig
//
//  Created by guille on 23/05/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGGeometryTests : SenTestCase

@property (strong, nonatomic) GIGGeometry *geometry;

@end

@implementation GIGGeometryTests

- (void)setUp {
    [super setUp];

    NSDictionary *representation = @{
            @"coordinates" : @[
                    @[
                            @[@2.2241006, @48.8155414],
                            @[@2.4699099, @48.8155414],
                            @[@2.4699099, @48.9021461],
                            @[@2.2241006, @48.9021461]
                    ]
            ],
            @"type" : @"Polygon"
    };

    self.geometry = [MTLJSONAdapter modelOfClass:GIGGeometry.class fromJSONDictionary:representation error:NULL];
}

- (void)tearDown {
    self.geometry = nil;
    [super tearDown];
}

- (void)testThatGeometryExists {
    STAssertNotNil(self.geometry, nil);
}

- (void)testThatGeometryInitializes {
    NSArray *coordinates = @[
            @[
                    @[@2.2241006, @48.8155414],
                    @[@2.4699099, @48.8155414],
                    @[@2.4699099, @48.9021461],
                    @[@2.2241006, @48.9021461]
            ]
    ];
    STAssertEqualObjects(self.geometry.coordinates, coordinates, nil);
    STAssertEqualObjects(self.geometry.type, @"Polygon", nil);
}

@end
