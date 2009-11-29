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
}

- (IBAction) checkOpenProfileChanged:(id)sender {
  [profileBox setEnabled:[checkOpenProfile state]];
  if ([profileBox isEnabled] && [profileBox indexOfSelectedItem] < 0)
    [profileBox selectItemAtIndex:0];
}

@end
