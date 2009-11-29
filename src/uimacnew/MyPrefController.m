//
//  MyPrefController.m
//  uimacnew
//
//  Created by mgee on 29.11.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MyPrefController.h"
#import "MyController.h"

@implementation MyPrefController

- (void)setupToolbar {
  [self addView:generalView label:@"General"];

  NSMutableArray *profiles = [MyController getProfiles];
  [profileBox removeAllItems];
  [profileBox addItemsWithObjectValues:profiles];
  NSUInteger index = [profiles indexOfObject:
                      [[NSUserDefaults standardUserDefaults] 
                       stringForKey:@"profileToOpen"]];
  if (index == NSNotFound) {
    [checkOpenProfile setState:NSOffState];
    [profileBox setStringValue:@""];
  } else
    [profileBox selectItemAtIndex:index];

  [self checkOpenProfileChanged:checkOpenProfile];
  [self updateFont:[MyController diffFont]];
}

- (IBAction) checkOpenProfileChanged:(id)sender {
  [profileBox setEnabled:[checkOpenProfile state]];
  if ([profileBox isEnabled] && [profileBox indexOfSelectedItem] < 0)
    [profileBox selectItemAtIndex:0];
}

- (IBAction) chooseFont:(id)sender {
  [[NSFontPanel sharedFontPanel] makeKeyAndOrderFront:self];
  [[NSFontManager sharedFontManager] setDelegate:self];
}

- (void) changeFont:(id)sender {
  NSFont *newFont = [sender convertFont:[MyController diffFont]];
  [[NSUserDefaults standardUserDefaults] setObject:[NSArchiver archivedDataWithRootObject:newFont] forKey:@"diffFont"];
  [[NSUserDefaults standardUserDefaults] synchronize];
  [MyController updateDiffFont:newFont];
  [self updateFont:newFont];
}

- (void) updateFont:(NSFont*)font {
  [labelFont setStringValue:[NSString stringWithFormat:@"%@ : %d", [font displayName], (NSInteger) [font pointSize]]];
}

@end
