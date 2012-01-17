// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Signature.h instead.

#import <CoreData/CoreData.h>


extern const struct SignatureAttributes {
	__unsafe_unretained NSString *hashString;
	__unsafe_unretained NSString *timestamp;
} SignatureAttributes;

extern const struct SignatureRelationships {
	__unsafe_unretained NSString *post;
} SignatureRelationships;

extern const struct SignatureFetchedProperties {
} SignatureFetchedProperties;

@class Post;




@interface SignatureID : NSManagedObjectID {}
@end

@interface _Signature : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SignatureID*)objectID;




@property (nonatomic, strong) NSString *hashString;


//- (BOOL)validateHashString:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber *timestamp;


@property int timestampValue;
- (int)timestampValue;
- (void)setTimestampValue:(int)value_;

//- (BOOL)validateTimestamp:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Post* post;

//- (BOOL)validatePost:(id*)value_ error:(NSError**)error_;




+ (NSArray*)fetchLastSignature:(NSManagedObjectContext*)moc_ ;
+ (NSArray*)fetchLastSignature:(NSManagedObjectContext*)moc_ error:(NSError**)error_;



@end

@interface _Signature (CoreDataGeneratedAccessors)

@end

@interface _Signature (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveHashString;
- (void)setPrimitiveHashString:(NSString*)value;




- (NSNumber*)primitiveTimestamp;
- (void)setPrimitiveTimestamp:(NSNumber*)value;

- (int)primitiveTimestampValue;
- (void)setPrimitiveTimestampValue:(int)value_;





- (Post*)primitivePost;
- (void)setPrimitivePost:(Post*)value;


@end
