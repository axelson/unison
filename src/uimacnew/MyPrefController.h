//
//  MyPrefController.h
//  uimacnew
//
//  Created by mgee on 29.11.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "DBPrefsWindowController.h"

@class MyController;

@interface MyPrefController : DBPrefsWindowController {
  IBOutlet NSView* generalView;
  IBOutlet NSComboBox* profileBox;
  IBOutlet NSButton* checkOpenProfile;
  IBOutlet NSTextField* labelFont;
}

- (IBAction) checkOpenProfileChanged:(id)sender;
- (IBAction) chooseFont:(id)sender;
- (void) updateFont:(NSFont*)font;

@end
