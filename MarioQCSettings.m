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
	
//	if ([ud integerForKey:@"mouseFollowMode"] == NSOnState) {
//		[self mouseFollowMode:nil];
//	}
//	if ([ud integerForKey:@"cpuMode"] == NSOnState) {
//		[self CpuMode:nil];
//	}
//    
//	[window makeKeyAndOrderFront:self];
}


/*
 アプリケーション終了時に実行
 設定ファイルにウィンドウ位置などを保存
 */
- (void)applicationWillTerminate : (NSNotification *)aNotification
{
	NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
	[ud setInteger:[window level] forKey:@"QCWindowLevel"];
//	
//	[ud setInteger:[mouseMode state] forKey:@"mouseFollowMode"];
//	[ud setInteger:[cpuMode state] forKey:@"cpuMode"];
//	
	// 設定ファイルに反映
	[ ud synchronize ];
}



@end