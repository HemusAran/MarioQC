#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

#import "QCWindow.h"

@interface MarioQCAppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet QCWindow *window;
    IBOutlet QCView *qcView;
    
    IBOutlet NSMenu *menuStatusBar;
    
    IBOutlet NSPopUpButton *displayList;
    
    float marioSize;
    float marioHeight;
}

@property (assign) IBOutlet NSWindow *window;

-(void)setDisplayList;
-(IBAction)setDisplayListAction:(id)sender;
-(IBAction)changeDisplay:(id)sender;

-(void)setHeightMario;
-(IBAction)heightMario:(id)sender;
-(IBAction)heightResetMario:(id)sender;
-(void)setResizeMario;
-(IBAction)resizeMario:(id)sender;
-(IBAction)resizeResetMario:(id)sender;
-(IBAction)windowViewChange:(id)sender;
-(void)setWindowLevel:(NSInteger)level;
-(void)installToolBarMenu;

@end
