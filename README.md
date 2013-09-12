# Gig

**Gig** provides an asynchronous block-based Objective-C wrapper for the Twitter 1.1 API. It makes use of [Mantle](https://github.com/github/Mantle) to model Twitter Platform objects and [AFNetworking](https://github.com/AFNetworking/AFNetworking) to perform the API requests.

## Status

Gig is very much work in progress. Models for Tweets, Users, Entities and Places are fully implemented. As for the API, Gig currently implements timeline and tweet related methods. The remaining methods will be implemented over time (pull requests are welcome!).

## Sample code

### Authentication

Gig uses the [Accounts Framework](https://developer.apple.com/library/ios/documentation/Accounts/Reference/AccountsFrameworkRef/_index.html) to authenticate API requests. Simply initialize your client with an `ACAccount` object and all the requests will be signed with that account.

```objc
GIGClient *client = [[GIGClient alloc] initWithAccount:account];
```

### Timelines

Use the `-fetchTimeline:parameters:completion` method to fetch tweets from a Twitter timeline.

```objc
// Fetch the two most recent tweets in my home timeline
[client fetchTimeline:GIGTimelineHome parameters:@{
        GIGCountKey : @2
} completion:^(NSArray *tweets, NSError *error) {
    for (GIGTweet *tweet in tweets) {
        NSLog(@"%@: %@", tweet.user.screenName, tweet.text);
    }
}];
```

### Tweets

```objc
// Update status

[client updateStatusWithText:@"Hello world!!!" parameters:nil completion:^(GIGTweet *tweet, NSError *error) {
    NSLog(@"statusID: %@", tweet.statusID);
}];
```

```objc
// Update status with media

NSData *data = UIImageJPEGRepresentation(picture, 1.0);
[client updateStatusWithText:@"Hello world!!!" media:data parameters:nil completion:^(GIGTweet *tweet, NSError *error) {
    GIGMedia *media = tweet.entities.media[0];
    NSLog(@"statusID: %@, mediaID: %@", tweet.statusID, media.mediaID);
}];
```

## Contact

[Guillermo Gonzalez](http://github.com/gonzalezreal)  
[@gonzalezreal](https://twitter.com/gonzalezreal)

## License

Gig is released under the MIT license. See [LICENSE.md](https://github.com/gonzalezreal/Gig/blob/master/LICENSE).
