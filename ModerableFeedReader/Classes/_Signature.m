// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Signature.m instead.

#import "_Signature.h"

const struct SignatureAttributes SignatureAttributes = {
	.hashString = @"hashString",
	.timestamp = @"timestamp",
};

const struct SignatureRelationships SignatureRelationships = {
	.post = @"post",
};

const struct SignatureFetchedProperties SignatureFetchedProperties = {
};

@implementation SignatureID
@end

@implementation _Signature

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Signature" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Signature";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Signature" inManagedObjectContext:moc_];
}

- (SignatureID*)objectID {
	return (SignatureID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"timestampValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"timestamp"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic hashString;






@dynamic timestamp;



- (int)timestampValue {
	NSNumber *result = [self timestamp];
	return [result intValue];
}

- (void)setTimestampValue:(int)value_ {
	[self setTimestamp:[NSNumber numberWithInt:value_]];
}

- (int)primitiveTimestampValue {
	NSNumber *result = [self primitiveTimestamp];
	return [result intValue];
}

- (void)setPrimitiveTimestampValue:(int)value_ {
	[self setPrimitiveTimestamp:[NSNumber numberWithInt:value_]];
}





@dynamic post;

	






+ (NSArray*)fetchLastSignature:(NSManagedObjectContext*)moc_ {
	NSError *error = nil;
	NSArray *result = [self fetchLastSignature:moc_ error:&error];
	if (error) {
#if TARGET_OS_IPHONE
		NSLog(@"error: %@", error);
#else
		[NSApp presentError:error];
#endif
	}
	return result;
}
+ (NSArray*)fetchLastSignature:(NSManagedObjectContext*)moc_ error:(NSError**)error_ {
	NSParameterAssert(moc_);
	NSError *error = nil;
	
	NSManagedObjectModel *model = [[moc_ persistentStoreCoordinator] managedObjectModel];
	
	NSDictionary *substitutionVariables = [NSDictionary dictionary];
										
	NSFetchRequest *fetchRequest = [model fetchRequestFromTemplateWithName:@"LastSignature"
													 substitutionVariables:substitutionVariables];
	NSAssert(fetchRequest, @"Can't find fetch request named \"LastSignature\".");
	
	NSArray *result = [moc_ executeFetchRequest:fetchRequest error:&error];
	if (error_) *error_ = error;
	return result;
}


@end
