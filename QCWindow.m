#import "QCWindow.h"


@implementation QCWindow

@synthesize initialLocation;


- (id)initWithContentRect:(NSRect)contentRect
				styleMask:(NSUInteger)aStyle
				  backing:(NSBackingStoreType)bufferingType
					defer:(BOOL)flag;
{
	NSRect main = [[NSScreen mainScreen] frame];	// フルスクリーンに
	
	NSWindow* result = [ super initWithContentRect : main
										 styleMask : NSBorderlessWindowMask 
										   backing : NSBackingStoreBuffered 
											 defer : NO ]; 
    
	[ result setBackgroundColor : [ NSColor clearColor ] ]; // 透明色
	[ result setAlphaValue : 1.0 ]; 
	[ result setOpaque : NO ]; 
	[ result setHasShadow : YES ]; 
//	[ result setLevel : NSStatusWindowLevel ];
	
	return (id)result; 
}

@end
