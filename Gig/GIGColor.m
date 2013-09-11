// GIGColor.m
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

#import "GIGColor.h"

#if TARGET_OS_IPHONE
    #import <UIKit/UIKit.h>
    #define GIGColor UIColor
#else
    #import <Cocoa/Cocoa.h>
    #define GIGColor NSColor
#endif

id GIGColorFromString(NSString *hexColor) {
    NSScanner *scanner = [NSScanner scannerWithString:hexColor];

    unsigned int value;
    if (![scanner scanHexInt:&value]) {
        return nil;
    }

    int red = (value >> 16) & 0xFF;
    int green = (value >> 8) & 0xFF;
    int blue = (value) & 0xFF;

#if TARGET_OS_IPHONE
    return [UIColor colorWithRed:red / 255.0f
                           green:green / 255.0f
                            blue:blue / 255.0f
                           alpha:1.0f];
#else
    return [NSColor colorWithCalibratedRed:red / 255.0f
                                     green:green / 255.0f
                                      blue:blue / 255.0f
                                     alpha:1.0f];
#endif
}

NSString *GIGStringFromColor(id c) {
    if (![c isKindOfClass:GIGColor.class]) {
        return nil;
    }

    GIGColor *color = c;
    CGColorSpaceModel colorSpaceModel = CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor));

    if (colorSpaceModel == kCGColorSpaceModelRGB) {
        CGFloat red, green, blue;
        [color getRed:&red green:&green blue:&blue alpha:NULL];

        int redValue = (int) (red * 255);
        int greenValue = (int) (green * 255);
        int blueValue = (int) (blue * 255);

        return [NSString stringWithFormat:@"%02x%02x%02x", redValue, greenValue, blueValue];
    }
    else if (colorSpaceModel == kCGColorSpaceModelMonochrome) {
        CGFloat white;
        [color getWhite:&white alpha:NULL];
        int whiteValue = (int) (white * 255);

        return [NSString stringWithFormat:@"%02x%02x%02x", whiteValue, whiteValue, whiteValue];
    }

    return nil;
}
