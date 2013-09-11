// GIGEntities.h
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
// Entities provide metadata and additional contextual information about content posted on Twitter.
// Entities are never divorced from the content they describe. In API v1.1, entities will be returned
// wherever Tweets are found in the API. Entities are instrumental in resolving URLs.
//
@interface GIGEntities : MTLModel <MTLJSONSerializing>

// Represents hashtags which have been parsed out of the Tweet text.
@property (copy, nonatomic, readonly) NSArray *hashtags;

// Represents media elements uploaded with the Tweet.
@property (copy, nonatomic, readonly) NSArray *media;

// Represents URLs included in the text of a Tweet.
@property (copy, nonatomic, readonly) NSArray *URLs;

// Represents other Twitter users mentioned in the text of the Tweet.
@property (copy, nonatomic, readonly) NSArray *userMentions;

@end
