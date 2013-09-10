// GIGURL.h
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

//
// Represents an URL included in the text of a Tweet or within textual fields of a user object.
//
@interface GIGURL : MTLModel <MTLJSONSerializing>

// Wrapped URL.
// This corresponds with the URL embedded directly into the raw Tweet text, and the value of the range property.
@property (copy, nonatomic, readonly) NSURL *URL;

// The range of the URL in the Tweet text.
@property (nonatomic, readonly) NSRange range;

// Version of the URL to display to clients.
@property (copy, nonatomic, readonly) NSString *displayURL;

// An expanded version of displayURL.
@property (copy, nonatomic, readonly) NSURL *expandedURL;

@end
