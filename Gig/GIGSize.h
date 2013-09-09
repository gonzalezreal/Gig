// GIGSize.h
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
#import <CoreGraphics/CoreGraphics.h>

//
// Media file size.
//
@interface GIGSize : MTLModel <MTLJSONSerializing>

// Width in pixels of this size.
@property (nonatomic, readonly) NSInteger width;

// Height in pixels of this size.
@property (nonatomic, readonly) NSInteger height;

// Resizing method used to obtain this size.
//
// A value of 'fit' means that the media was resized to fit one dimension, keeping its native aspect ratio.
// A value of 'crop' means that the media was cropped in order to fit a specific resolution.
@property (copy, nonatomic, readonly) NSString *resizingMethod;

// Returns a size structure representing the data in the receiver.
@property (nonatomic, readonly) CGSize CGSize;

@end
