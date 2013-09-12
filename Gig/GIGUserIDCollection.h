// GIGUserIDCollection.h
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

// A cursored collection of user IDs
//
// See https://dev.twitter.com/docs/misc/cursoring
@interface GIGUserIDCollection : MTLModel <MTLJSONSerializing>

// The cursor that you should send to the endpoint to receive the previous batch of IDs.
@property (copy, nonatomic, readonly) NSNumber *previousCursor;

// The cursor that you should send to the endpoint to receive the next batch of IDs.
@property (copy, nonatomic, readonly) NSNumber *nextCursor;

// Array of user IDs.
@property (copy, nonatomic, readonly) NSArray *IDs;

@end
