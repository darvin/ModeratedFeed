// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Author.m instead.

#import "_Author.h"

const struct AuthorAttributes AuthorAttributes = {
	.imageURL = @"imageURL",
	.name = @"name",
	.subtitle = @"subtitle",
	.title = @"title",
	.url = @"url",
};

const struct AuthorRelationships AuthorRelationships = {
	.posts = @"posts",
};

const struct AuthorFetchedProperties AuthorFetchedProperties = {
};

@implementation AuthorID
@end

@implementation _Author

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Author";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Author" inManagedObjectContext:moc_];
}

- (AuthorID*)objectID {
	return (AuthorID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic imageURL;






@dynamic name;






@dynamic subtitle;






@dynamic title;






@dynamic url;






@dynamic posts;

	
- (NSMutableSet*)postsSet {
	[self willAccessValueForKey:@"posts"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"posts"];
  
	[self didAccessValueForKey:@"posts"];
	return result;
}
	





@end
