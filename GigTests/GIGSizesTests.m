//
//  GIGSizesTests.m
//  Gig
//
//  Created by guille on 22/05/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGSizesTests : SenTestCase

@property (strong, nonatomic) GIGSizes *sizes;

@end

@implementation GIGSizesTests

- (void)setUp {
    [super setUp];

    NSDictionary *representation = @{
            @"thumb" : @{
                    @"w" : @(75),
                    @"h" : @(75),
            },
            @"large" : @{
                    @"w" : @(300),
                    @"h" : @(300),
            },
            @"medium" : @{
                    @"w" : @(200),
                    @"h" : @(200),
            },
            @"small" : @{
                    @"w" : @(150),
                    @"h" : @(150),
            }
    };

    self.sizes = [MTLJSONAdapter modelOfClass:GIGSizes.class fromJSONDictionary:representation error:NULL];
}

- (void)tearDown {
    self.sizes = nil;
    [super tearDown];
}

- (void)testThatSizesExists {
    STAssertNotNil(self.sizes, nil);
}

- (void)testThatSizesInitializes {
    STAssertTrue([self.sizes.thumbnail isKindOfClass:GIGSize.class], nil);
    STAssertEquals(self.sizes.thumbnail.CGSize, CGSizeMake(75, 75), nil);

    STAssertTrue([self.sizes.large isKindOfClass:GIGSize.class], nil);
    STAssertEquals(self.sizes.large.CGSize, CGSizeMake(300, 300), nil);

    STAssertTrue([self.sizes.medium isKindOfClass:GIGSize.class], nil);
    STAssertEquals(self.sizes.medium.CGSize, CGSizeMake(200, 200), nil);

    STAssertTrue([self.sizes.small isKindOfClass:GIGSize.class], nil);
    STAssertEquals(self.sizes.small.CGSize, CGSizeMake(150, 150), nil);
}

@end
