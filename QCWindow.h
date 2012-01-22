#import <Cocoa/Cocoa.h>


@interface QCWindow : NSWindow {
    NSPoint initialLocation;
}
@property (assign) NSPoint initialLocation;
@end
