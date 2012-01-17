//
//  PostController.m
//  ModerableFeedReader
//
//  Created by Sergey Klimov on 1/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PostController.h"
#import "SHK.h"
@implementation PostController
@synthesize post=_post;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void) awakeFromNib {
    UIBarButtonItem *shareButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(share)];
    UIBarButtonItem *commentsButton = self.navigationItem.rightBarButtonItem;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:shareButton, commentsButton, nil];
}

- (void)share
{
    [SHK setRootViewController:self.tabBarController];

	SHKItem *item = [SHKItem URL:[NSURL URLWithString: self.post.url] title:self.post.title];
    
	SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
    
	[actionSheet showFromToolbar:self.navigationController.toolbar];

}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) setPost:(Post *)post {
    _post = post;
    self.title = post.title;
    UIWebView* webView = (UIWebView*)self.view;
    [webView loadHTMLString:post.content baseURL:[NSURL URLWithString: post.url]];
    
}

@end
