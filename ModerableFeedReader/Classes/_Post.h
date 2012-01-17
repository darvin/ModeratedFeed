// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Post.h instead.

#import <CoreData/CoreData.h>


extern const struct PostAttributes {
	__unsafe_unretained NSString *content;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *hashString;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *url;
} PostAttributes;

extern const struct PostRelationships {
	__unsafe_unretained NSString *author;
	__unsafe_unretained NSString *signature;
	__unsafe_unretained NSString *tags;
} PostRelationships;

extern const struct PostFetchedProperties {
} PostFetchedProperties;

@class Author;
@class Signature;
@class Tag;







@interface PostID : NSManagedObjectID {}
@end

@interface _Post : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PostID*)objectID;




@property (nonatomic, strong) NSString *content;


//- (BOOL)validateContent:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSDate *date;


//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *hashString;


//- (BOOL)validateHashString:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *title;


//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *url;


//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Author* author;

//- (BOOL)validateAuthor:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Signature* signature;

//- (BOOL)validateSignature:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* tags;

- (NSMutableSet*)tagsSet;




+ (NSArray*)fetchTest:(NSManagedObjectContext*)moc_ ;
+ (NSArray*)fetchTest:(NSManagedObjectContext*)moc_ error:(NSError**)error_;



+ (NSArray*)fetchPublishedPosts:(NSManagedObjectContext*)moc_ ;
+ (NSArray*)fetchPublishedPosts:(NSManagedObjectContext*)moc_ error:(NSError**)error_;



+ (NSArray*)fetchPostByAuthor:(NSManagedObjectContext*)moc_ ;
+ (NSArray*)fetchPostByAuthor:(NSManagedObjectContext*)moc_ error:(NSError**)error_;



@end

@interface _Post (CoreDataGeneratedAccessors)

- (void)addTags:(NSSet*)value_;
- (void)removeTags:(NSSet*)value_;
- (void)addTagsObject:(Tag*)value_;
- (void)removeTagsObject:(Tag*)value_;

@end

@interface _Post (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveContent;
- (void)setPrimitiveContent:(NSString*)value;




- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSString*)primitiveHashString;
- (void)setPrimitiveHashString:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;





- (Author*)primitiveAuthor;
- (void)setPrimitiveAuthor:(Author*)value;



- (Signature*)primitiveSignature;
- (void)setPrimitiveSignature:(Signature*)value;



- (NSMutableSet*)primitiveTags;
- (void)setPrimitiveTags:(NSMutableSet*)value;


@end
