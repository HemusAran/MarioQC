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
    [self installToolBarMenu];
}

- (void) dealloc
{
    [super dealloc];
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
-(IBAction)windowViewChange:(id)sender
{
    if ([window level] != kCGDesktopWindowLevel) {
        [self setWindowLevel:kCGDesktopWindowLevel];
    } else {
        [self setWindowLevel:-1];
    }
}

-(void)setWindowLevel:(NSInteger)level
{
    if (level != kCGDesktopWindowLevel) {
		level = kCGHelpWindowLevel;
	}
	
	[window setLevel:level];
}



/*
 メニューバーに追加
 */
- (void) installToolBarMenu
{
    NSStatusBar *bar = [ NSStatusBar systemStatusBar ];
    NSStatusItem *sbItem = [ bar statusItemWithLength : NSVariableStatusItemLength ];
    [ sbItem retain ];

    [ sbItem setTitle : @"" ];
    [ sbItem setImage : [NSImage imageNamed:@"SBIcon.tiff"] ];
    [ sbItem setAlternateImage : [NSImage imageNamed:@"SBIcon_alf.tiff"] ];
    [ sbItem setToolTip : @"MarioQC" ];
    [ sbItem setHighlightMode : YES ];
    
	[ sbItem setMenu : menuStatusBar ];
}




@end
