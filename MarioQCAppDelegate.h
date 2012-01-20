//
//  MarioQCAppDelegate.h
//  MarioQC
//
//  Created by mitsuba on 10/09/14.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

#import "QCWindow.h"

@interface MarioQCAppDelegate : NSObject { //<NSApplicationDelegate> {
    IBOutlet QCWindow *window;
	IBOutlet QCView *qcView;
}

@property (assign) IBOutlet NSWindow *window;

-(IBAction)windowViewFront:(id)sender;

@end
