// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Tag.h instead.

#import <CoreData/CoreData.h>


extern const struct TagAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *nameLowerCase;
} TagAttributes;

extern const struct TagRelationships {
	__unsafe_unretained NSString *posts;
} TagRelationships;

extern const struct TagFetchedProperties {
} TagFetchedProperties;

@class Post;




@interface TagID : NSManagedObjectID {}
@end

@interface _Tag : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TagID*)objectID;




@property (nonatomic, strong) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *nameLowerCase;


//- (BOOL)validateNameLowerCase:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* posts;

- (NSMutableSet*)postsSet;




@end

@interface _Tag (CoreDataGeneratedAccessors)

- (void)addPosts:(NSSet*)value_;
- (void)removePosts:(NSSet*)value_;
- (void)addPostsObject:(Post*)value_;
- (void)removePostsObject:(Post*)value_;

@end

@interface _Tag (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveNameLowerCase;
- (void)setPrimitiveNameLowerCase:(NSString*)value;





- (NSMutableSet*)primitivePosts;
- (void)setPrimitivePosts:(NSMutableSet*)value;


@end
