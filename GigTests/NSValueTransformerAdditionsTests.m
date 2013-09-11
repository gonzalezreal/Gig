//
//  NSValueTransformerAdditionsTests.m
//  Gig
//
//  Created by guille on 22/05/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

#if TARGET_OS_IPHONE
    #import <UIKit/UIKit.h>
#else
    #import <Cocoa/Cocoa.h>
#endif

@interface NSValueTransformerAdditionsTests : SenTestCase

@end

@implementation NSValueTransformerAdditionsTests

- (void)testRangeValueTransformer {
    NSValueTransformer *transformer = [NSValueTransformer valueTransformerForName:GIGRangeValueTransformerName];
    STAssertNotNil(transformer, nil);
    STAssertTrue([transformer.class allowsReverseTransformation], nil);

    NSValue *value = [transformer transformedValue:@[@32, @36]];
    STAssertTrue(NSEqualRanges(value.rangeValue, NSMakeRange(32, 4)), nil);

    value = [transformer transformedValue:nil];
    STAssertTrue(NSEqualRanges(value.rangeValue, NSMakeRange(NSNotFound, 0)), nil);

    NSArray *array = [transformer reverseTransformedValue:[NSValue valueWithRange:NSMakeRange(32, 4)]];
    STAssertEqualObjects(array, (@[@32, @36]), nil);

    array = [transformer reverseTransformedValue:nil];
    STAssertNil(array, nil);
}

- (void)testDateValueTransformer {
    NSValueTransformer *transformer = [NSValueTransformer valueTransformerForName:GIGDateValueTransformerName];
    STAssertNotNil(transformer, nil);
    STAssertTrue([transformer.class allowsReverseTransformation], nil);

    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [dateComponents setDay:27];
    [dateComponents setMonth:8];
    [dateComponents setYear:2008];
    [dateComponents setHour:13];
    [dateComponents setMinute:8];
    [dateComponents setSecond:45];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorian dateFromComponents:dateComponents];

    NSDate *transformedDate = [transformer transformedValue:@"Wed Aug 27 13:08:45 +0000 2008"];
    STAssertEqualObjects(transformedDate, date, nil);
    STAssertNil([transformer transformedValue:nil], nil);

    STAssertEqualObjects([transformer reverseTransformedValue:date], @"Wed Aug 27 13:08:45 +0000 2008", nil);
    STAssertNil([transformer reverseTransformedValue:nil], nil);
}

- (void)testColorValueTransformer {
    NSValueTransformer *transformer = [NSValueTransformer valueTransformerForName:GIGColorValueTransformerName];
    STAssertNotNil(transformer, nil);
    STAssertTrue([transformer.class allowsReverseTransformation], nil);

#if TARGET_OS_IPHONE
    UIColor *color = [UIColor colorWithRed:169 / 255.f green:217 / 255.f blue:241 / 255.f alpha:1.f];
    UIColor *grayColor = [UIColor colorWithWhite:128 / 255.f alpha:1];
#else
    NSColor *color = [NSColor colorWithCalibratedRed:169 / 255.f green:217 / 255.f blue:241 / 255.f alpha:1.f];
    NSColor *grayColor = [NSColor colorWithCalibratedWhite:128 / 255.f alpha:1];
#endif

    id transformedColor = [transformer transformedValue:@"a9d9f1"];
    STAssertEqualObjects(color, transformedColor, nil);

    transformedColor = [transformer transformedValue:nil];
    STAssertNil(transformedColor, nil);

    NSString *hexString = [transformer reverseTransformedValue:color];
    STAssertEqualObjects(hexString, @"a9d9f1", nil);

    hexString = [transformer reverseTransformedValue:grayColor];
    STAssertEqualObjects(hexString, @"808080", nil);

    hexString = [transformer reverseTransformedValue:nil];
    STAssertNil(hexString, nil);
}

@end
