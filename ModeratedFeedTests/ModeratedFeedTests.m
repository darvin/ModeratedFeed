//
//  RssModerableFeedReaderTests.m
//  RssModerableFeedReaderTests
//
//  Created by Sergey Klimov on 1/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModeratedFeedTests.h"
#import "Post.h"
#import "Signature.h"
#import "Tag.h"
#import "Author.h"
#import "IADisquser.h"

@interface ModeratedFeedTests () 

- (BOOL)waitForCompletion:(NSTimeInterval)timeoutSecs;
@end

@implementation ModeratedFeedTests
- (BOOL)waitForCompletion:(NSTimeInterval)timeoutSecs
{
	NSDate	*timeoutDate = [NSDate dateWithTimeIntervalSinceNow:timeoutSecs];
    
	do {
		[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.001]];
		if([timeoutDate timeIntervalSinceNow] < 0.0)
			break;
	} while (!done);
    
	return done;
}

- (void)setUp
{
#ifdef LOCAL_SERVER_DEBUG
    apiURL = [NSURL URLWithString:@"http://localhost:8080/api"];
#else
    apiURL = [NSURL URLWithString:@"http://moderable-feed.appspot.com/api"];
#endif    
    [MagicalRecordHelpers setupCoreDataStackWithInMemoryStore];
}

- (void)tearDown
{
    
    [MagicalRecordHelpers cleanUp];
    
}

- (void)testSignatureFetching
{
    [Signature fetchFromUrl:apiURL];
    [self waitForCompletion:3.0];
    
    NSAssert([[Signature findAll] count]>0, @"signatures not fetched");
}



- (void)testTagFetching
{
    [Tag fetchFromUrl: apiURL success:nil];
    [self waitForCompletion:3.0];
    NSAssert([[Tag findAll] count]>0, @"tags not fetched");
    
    
}

- (void)testPostFetching
{
    [Post fetchFromUrl:apiURL];
    [self waitForCompletion:3.0];
    NSAssert([[Post findAll] count]>0, @"posts not fetched");
    
    NSAssert([[Author findAll] count]>0, @"authors not populated");
    
}

- (void)testTaggedPostsFetching 
{
    [Tag fetchFromUrl:apiURL success:nil];
    [self waitForCompletion:3.0];
    NSAssert([[Tag findAll] count]>0, @"tags not fetched");
    
    [Post fetchFromUrl:apiURL];
    [self waitForCompletion:3.0];
    NSAssert([[Post findAll] count]>0, @"posts not fetched");
    
    NSAssert([[Author findAll] count]>0, @"authors are not populated");
    
    
    int populatedTags = 0;
    for (Tag* tag in [Tag findAll]) {
        populatedTags += [[tag posts] count];
    }
    
    NSAssert(populatedTags>0, @"tags are not populated");
}

- (void)testPublishedPostsFetching
{
    [Signature fetchFromUrl:apiURL];
    [self waitForCompletion:3.0];
    NSAssert([[Signature findAll] count]>0, @"signatures not fetched");
    
    [Post fetchFromUrl:apiURL];
    [self waitForCompletion:3.0];
    NSAssert([[Post findAll] count]>0, @"posts not fetched");
    
    
    NSAssert([[Post fetchPublishedPosts:[NSManagedObjectContext defaultContext]] count]>0, @"no published posts");
    
    
}


- (void)testPublishedPostsFetching2
{
    
    [Post fetchFromUrl:apiURL];
    [self waitForCompletion:3.0];
    NSAssert([[Post findAll] count]>0, @"posts not fetched");
    
    [Signature fetchFromUrl:apiURL];
    [self waitForCompletion:3.0];
    NSAssert([[Signature findAll] count]>0, @"signatures not fetched");
    
        
    NSAssert([[Post fetchPublishedPosts:[NSManagedObjectContext defaultContext]] count]>0, @"no published posts");
    
    
}



@end

