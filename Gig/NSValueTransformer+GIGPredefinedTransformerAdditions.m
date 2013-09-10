// NSValueTransformer+GIGPredefinedTransformerAdditions.m
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

#import "NSValueTransformer+GIGPredefinedTransformerAdditions.h"
#import "GIGColor.h"

#import <Mantle/Mantle.h>

NSString * const GIGRangeValueTransformerName = @"GIGRangeValueTransformerName";
NSString * const GIGDateValueTransformerName = @"GIGDateValueTransformerName";
NSString * const GIGColorValueTransformerName = @"GIGColorValueTransformerName";

static NSDateFormatter *GIGTwitterDateFormatter() {
    static dispatch_once_t onceToken;
    static NSDateFormatter *dateFormatter;

    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        [dateFormatter setDateFormat:@"eee MMM dd HH:mm:ss Z yyyy"];
    });

    return dateFormatter;
}

@implementation NSValueTransformer (GIGPredefinedTransformerAdditions)

+ (void)load {
    @autoreleasepool {
        //
        // GIGRangeValueTransformerName
        //

        MTLValueTransformer *rangeValueTransformer = [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSArray *array) {
            if ([array isKindOfClass:[NSArray class]] && [array count] >= 2) {
                NSUInteger offset1 = [array[0] unsignedIntegerValue];
                NSUInteger offset2 = [array[1] unsignedIntegerValue];

                if (offset1 < offset2) {
                    return [NSValue valueWithRange:NSMakeRange(offset1, offset2 - offset1)];
                }
            }

            return [NSValue valueWithRange:NSMakeRange(NSNotFound, 0)];
        } reverseBlock:^id(NSValue *value) {
            if (value && [value isKindOfClass:[NSValue class]]) {
                NSAssert(strcmp([value objCType], @encode(NSRange)) == 0, @"*** Expected a range, got: %@", value);

                NSRange range = [value rangeValue];
                if (range.location != NSNotFound && range.length > 0) {
                    return @[@(range.location), @(range.location + range.length)];
                }
            }

            return nil;
        }];

        [NSValueTransformer setValueTransformer:rangeValueTransformer forName:GIGRangeValueTransformerName];

        //
        // GIGDateValueTransformerName
        //

        MTLValueTransformer *dateValueTransformer = [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *value) {
            if ([value isKindOfClass:[NSString class]]) {
                NSDateFormatter *dateFormatter = GIGTwitterDateFormatter();
                return [dateFormatter dateFromString:value];
            }
            return nil;
        } reverseBlock:^id(NSDate *date) {
            if ([date isKindOfClass:[NSDate class]]) {
                NSDateFormatter *dateFormatter = GIGTwitterDateFormatter();
                return [dateFormatter stringFromDate:date];
            }
            return nil;
        }];

        [NSValueTransformer setValueTransformer:dateValueTransformer forName:GIGDateValueTransformerName];

        //
        // GIGColorValueTransformerName
        //

        MTLValueTransformer *colorValueTransformer = [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *value) {
            if ([value isKindOfClass:[NSString class]]) {
                return GIGColorFromString(value);
            }
            return nil;
        } reverseBlock:^id(id color) {
            return GIGStringFromColor(color);
        }];

        [NSValueTransformer setValueTransformer:colorValueTransformer forName:GIGColorValueTransformerName];
    }
}

@end
