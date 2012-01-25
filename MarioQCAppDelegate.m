#import "MarioQCAppDelegate.h"

@implementation MarioQCAppDelegate

@synthesize window;

- (void) awakeFromNib
{	
	if(![qcView loadCompositionFromFile:[[NSBundle mainBundle] pathForResource:@"MarioQC" ofType:@"qtz"]]) {
		NSLog(@"Could not load composition");
	}
	
    [self installToolBarMenu];
}

-(void)setHeightMario
{
    [qcView setValue:[NSNumber numberWithDouble:marioHeight] forInputKey:@"YPosition"];
}
-(IBAction)heightMario:(id)sender
{
    if ([sender tag] == 1) {
        if (marioHeight < 1.0) {
            marioHeight += 0.01;
        }
    } else {
        if (marioHeight > -1.0) {
            marioHeight -= 0.01;
        }
    }
    [self setHeightMario];
    
}


-(void)setResizeMario
{
    [qcView setValue:[NSNumber numberWithDouble:marioSize] forInputKey:@"Scale"];
}
-(IBAction)resizeMario:(id)sender
{
    if ([sender tag] == 1) {
        if (marioSize < 5) {
            marioSize += 0.01;
        }
    } else {
        if (marioSize > -0.01) {
            marioSize -= 0.01;
        }
    }
    [self setResizeMario];
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

