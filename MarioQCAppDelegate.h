#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

#import "QCWindow.h"

@interface MarioQCAppDelegate : NSObject { //<NSApplicationDelegate> {
    IBOutlet QCWindow *window;
    IBOutlet QCView *qcView;
    IBOutlet NSMenu *menuStatusBar;
}

@property (assign) IBOutlet NSWindow *window;

-(IBAction)windowViewFront:(id)sender;
-(void)installToolBarMenu;

@end
