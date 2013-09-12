//
//  GIGUserIDCollectionTests.m
//  Gig
//
//  Created by guille on 12/09/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGUserIDCollectionTests : SenTestCase

@property (strong, nonatomic) GIGUserIDCollection *collection;

@end

@implementation GIGUserIDCollectionTests

- (void)setUp {
    [super setUp];

    NSDictionary *representation = @{
            @"ids": @[
                    @385752029,
                    @602890434,
                    @333181469,
                    @333165023
            ],
            @"next_cursor": @1374004777531007833,
            @"previous_cursor": @0
    };

    self.collection = [MTLJSONAdapter modelOfClass:GIGUserIDCollection.class fromJSONDictionary:representation error:NULL];
}

- (void)tearDown {
    self.collection = nil;
    [super tearDown];
}

- (void)testThatCollectionExists {
    STAssertNotNil(self.collection, nil);
}

- (void)testThatCollectionInitializes {
    STAssertEqualObjects(self.collection.previousCursor, @0, nil);

    STAssertEqualObjects(self.collection.nextCursor, @1374004777531007833, nil);

    STAssertEqualObjects(self.collection.IDs, (@[@385752029, @602890434, @333181469, @333165023]), nil);
}

@end