//
//  PostsListController.m
//  ModerableFeedReader
//
//  Created by Sergey Klimov on 1/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PostsListController.h"
#import "FRCFetchedResultsTableViewDataSource.h"
#import "Post.h"
#import "Signature.h"
#import "Tag.h"
#import "Author.h"
#import "PostTableViewCell.h"
#import "PostController.h"
#import "SKAppDelegate.h"

@implementation PostsListController{
    __strong FRCFetchedResultsTableViewDataSource *fetchedResultsDS;
}
@synthesize relatedTo = _relatedTo;



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
            //
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void) setupDataSource {
    SKAppDelegate* app = (SKAppDelegate*)[UIApplication sharedApplication].delegate;
    NSURL* apiURL = app.apiURL;

    
    
    fetchedResultsDS = [[FRCFetchedResultsTableViewDataSource alloc] init];
    fetchedResultsDS.tableView = self.tableView;
    fetchedResultsDS.cellClass = [PostTableViewCell class];
    fetchedResultsDS.managedObjectContext = [NSManagedObjectContext defaultContext];
    
    id relatedTo = self.relatedTo;
    fetchedResultsDS.fetchRequestBlock = (^{
        NSPredicate *predicate;
        
        if (relatedTo) {
            if ([relatedTo class]==[Tag class]) {
               predicate = [NSPredicate predicateWithFormat:@"( signature != nil ) AND (ANY tags.name==%@)",((Tag*)relatedTo).name]; 
                
            }
            else if ([relatedTo class]==[Author class]) {
                predicate = [NSPredicate predicateWithFormat:@"( signature != nil ) AND (author.url=%@)", ((Author*)relatedTo).url]; 
            }
        } else {
            predicate = [NSPredicate predicateWithFormat:@"( signature != nil )"];
        }
        
        NSFetchRequest  *request = [Post requestAllSortedBy:@"date" ascending:YES withPredicate:predicate];
        
        [request setFetchBatchSize:20];
        NSArray* res = [Post executeFetchRequest:request];
        return request;
    });
    
    self.tableView.dataSource = fetchedResultsDS;
    [fetchedResultsDS loadFetchRequest];
}

#pragma mark - View lifecycle




- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    SKAppDelegate* app = (SKAppDelegate*)[UIApplication sharedApplication].delegate;
    NSURL* apiURL = app.apiURL;
    [Tag fetchFromUrl:apiURL success: ^(NSArray* fetchedEntitles) {
        [Post fetchFromUrl:apiURL];
        
    }];

    
    [Signature fetchFromUrl:apiURL];
    
    [Author fetchFromUrl:apiURL success: ^(NSArray* fetchedEntitles) {
        [self setupDataSource];

    }];


    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    Post *post = [fetchedResultsDS objectAtIndexPath:path];

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Assume self.view is the table view
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    Post *post = [fetchedResultsDS objectAtIndexPath:path];
    [segue.destinationViewController setPost:post];
}

@end
