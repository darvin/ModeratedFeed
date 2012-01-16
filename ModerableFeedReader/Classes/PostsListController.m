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
#import "PostTableViewCell.h"

@implementation PostsListController{
    __strong FRCFetchedResultsTableViewDataSource *fetchedResultsDS;
}

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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [Signature fetchFromUrl:[NSURL URLWithString:@"http://localhost:8080/api"]];

    [Post fetchFromUrl:[NSURL URLWithString:@"http://localhost:8080/api"]];
    
    
    fetchedResultsDS = [[FRCFetchedResultsTableViewDataSource alloc] init];
    fetchedResultsDS.tableView = self.tableView;
    fetchedResultsDS.cellClass = [PostTableViewCell class];
    fetchedResultsDS.managedObjectContext = [NSManagedObjectContext defaultContext];
    NSFetchRequest  *request = [Post requestAllSortedBy:@"date" ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"( signature != nil )"]];

    [request setFetchBatchSize:20];
    
    fetchedResultsDS.fetchRequest = request;

    self.tableView.dataSource = fetchedResultsDS;
    
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
