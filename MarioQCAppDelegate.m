#import "MarioQCAppDelegate.h"

@implementation MarioQCAppDelegate

@synthesize window;

- (void) awakeFromNib
{	
	if(![qcView loadCompositionFromFile:[[NSBundle mainBundle] pathForResource:@"MarioQC" ofType:@"qtz"]]) {
		NSLog(@"Could not load composition");
	}
	
    [window setFrameAutosaveName:@"Window SavedName"];
    [self setDisplayList];
    [self installToolBarMenu];
}


/*
 環境設定にディスプレイ一覧をセット
 */
-(void)setDisplayList
{
    NSMenu *screenMenu = [[[NSMenu alloc] initWithTitle:@"display list"] autorelease];
    NSArray *screenArray = [NSScreen screens];
    int item_count = 0;
    
    for (NSScreen *screen in screenArray) {
        NSDictionary *screenDescription = [screen deviceDescription];
        
        NSNumber *displayID = [screenDescription objectForKey:@"NSScreenNumber"];
        NSString *displayName = nil;
        if (! item_count) {
            displayName = [NSString stringWithFormat:@"Main Display"];
        } else {
            displayName = [NSString stringWithFormat:@"Sub Display%d", item_count];
        }
        
        NSMenuItem *menuItem = [[[NSMenuItem alloc] initWithTitle:displayName
                                                           action:nil 
                                                    keyEquivalent:@""] autorelease];
        [menuItem setTag:[displayID intValue]];
        [menuItem setRepresentedObject:screen];
        [screenMenu addItem:menuItem];
        item_count++;
    }
    
    [displayList setMenu:screenMenu];
}
-(IBAction)setDisplayListAction:(id)sender
{
    [self setDisplayList];
}

/*
 表示するディスプレイを変更
 */
-(IBAction)changeDisplay:(id)sender
{
    NSScreen *selectScreen = [[displayList selectedItem] representedObject];
    [window setFrame:[selectScreen frame] display:YES];
}


/*
 メニューバーに追加
 */
-(void)installToolBarMenu
{
    NSStatusBar *bar = [ NSStatusBar systemStatusBar ];
    NSStatusItem *sbItem = [ bar statusItemWithLength : NSVariableStatusItemLength ];
    [ sbItem retain ];
    
    [ sbItem setTitle : @"" ];
    [ sbItem setImage : [NSImage imageNamed:@"SBIcon_main.png"] ];
    [ sbItem setAlternateImage : [NSImage imageNamed:@"SBIcon_alf.png"] ];
    [ sbItem setToolTip : @"MarioQC" ];
    [ sbItem setHighlightMode : YES ];
    
	[ sbItem setMenu : menuStatusBar ];
}


/*
 歩く位置（高さ）の変更
 */
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
-(IBAction)heightResetMario:(id)sender
{
    marioHeight = 0;
    [self setHeightMario];
}


/*
 大きさの変更
 */
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
-(IBAction)resizeResetMario:(id)sender
{
    marioSize = 0.1;
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

@end

