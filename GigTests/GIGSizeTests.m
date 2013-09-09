//
//  GIGSizeTests.m
//  Gig
//
//  Created by guille on 22/05/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

@interface GIGSizeTests : SenTestCase

@property (strong, nonatomic) GIGSize *size;

@end

@implementation GIGSizeTests

- (void)setUp {
    [super setUp];
    
    NSDictionary *representation = @{
            @"w" : @(150),
            @"h" : @(75),
            @"resize" : @"crop"
    };
    
    self.size = [MTLJSONAdapter modelOfClass:GIGSize.class fromJSONDictionary:representation error:NULL];
}

- (void)tearDown {
    self.size = nil;
    [super tearDown];
}

- (void)testThatSizeExists {
    STAssertNotNil(self.size, nil);
}

- (void)testThatSizeInitializes {
    STAssertTrue(self.size.width == 150, nil);
    STAssertTrue(self.size.height == 75, nil);
    STAssertEqualObjects(self.size.resizingMethod, @"crop", nil);
}

- (void)testCGSize {
    STAssertEquals(self.size.CGSize, CGSizeMake(150, 75), nil);
}

@end
