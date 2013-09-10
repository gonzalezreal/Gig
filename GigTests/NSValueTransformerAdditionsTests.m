//
//  NSValueTransformerAdditionsTests.m
//  Gig
//
//  Created by guille on 22/05/13.
//  Copyright (c) 2013 Guillermo Gonzalez. All rights reserved.
//

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

@end
