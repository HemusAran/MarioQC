#import "MarioQCAppDelegate.h"

@interface MarioQCAppDelegate (Settings)
@end

@implementation MarioQCAppDelegate (Settings)

/*
 アプリケーション開始時に実行
 設定ファイルを読み込んでウィンドウ位置など反映
 */
- (void)applicationWillFinishLaunching : (NSNotification *)aNotification
{	
	NSUserDefaults* ud = [ NSUserDefaults standardUserDefaults ];
    
    [self setWindowLevel:[ud integerForKey:@"QCWindowLevel"]];
	
    marioSize = [ud floatForKey:@"marioSize"];
    if (marioSize <= 0) marioSize = 0.1;
    [self setResizeMario];
    
    marioHeight = [ud floatForKey:@"marioHeight"];
    [self setHeightMario];
    
    [window makeKeyAndOrderFront:self];
}


/*
 アプリケーション終了時に実行
 設定ファイルにウィンドウ位置などを保存
 */
- (void)applicationWillTerminate : (NSNotification *)aNotification
{
	NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
	[ud setInteger:[window level] forKey:@"QCWindowLevel"];
    [ud setFloat:marioSize forKey:@"marioSize"];
    [ud setFloat:marioHeight forKey:@"marioHeight"];

	// 設定ファイルに反映
	[ ud synchronize ];
}



@end