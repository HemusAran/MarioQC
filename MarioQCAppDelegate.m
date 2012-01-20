//
//  MarioQCAppDelegate.m
//  MarioQC
//
//  Created by mitsuba on 10/09/14.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MarioQCAppDelegate.h"

@implementation MarioQCAppDelegate

@synthesize window;

- (void) awakeFromNib
{	
	if(![qcView loadCompositionFromFile:[[NSBundle mainBundle] pathForResource:@"MarioQC" ofType:@"qtz"]]) {
		NSLog(@"Could not load composition");
	}
	
    [qcView setValue:[NSNumber numberWithDouble:-0.61] forInputKey:@"YPosition"];
    [qcView setValue:[NSNumber numberWithDouble:0.02] forInputKey:@"Scale"];
	[self windowViewFront:nil];
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

/*
 ウィンドウ操作不可
 */
- (void)applicationDidResignActive:(NSNotification *)aNotification
{
    [window setIgnoresMouseEvents:YES];
}
- (void)applicationDidBecomeActive:(NSNotification *)aNotification
{
    [window setIgnoresMouseEvents:YES];
}


/*
 ウィンドウレベル
 */
-(IBAction)windowViewFront:(id)sender
{
	//前面
	[window setLevel:kCGHelpWindowLevel];
}



@end