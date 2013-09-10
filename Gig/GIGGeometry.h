// GIGGeometry.h
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
// GeoJSON geometry. See http://www.geojson.org/geojson-spec.html.
//
// Used to represent the geographic location of a Tweet or the
// bounding box which encloses a Place.
//
@interface GIGGeometry : MTLModel <MTLJSONSerializing>

// For geographic locations:
//
// The longitude and latitude of the Tweet location, as an collection in
// the form of [longitude, latitude].
//
// For bounding boxes:
//
// A series of longitude and latitude points, defining a box which will
// contain the Place entity this bounding box is related to. Each point
// is an array in the form of [longitude, latitude]. Points are grouped
// into an array per bounding box. Bounding box arrays are wrapped in
// one additional array to be compatible with the polygon notation.
@property (copy, nonatomic, readonly) NSArray *coordinates;

// The type of data encoded in the coordinates property.
//
// This will be "Point" for Tweet coordinates fields and "Polygon"
// for bounding boxes.
@property (copy, nonatomic, readonly) NSString *type;

@end
