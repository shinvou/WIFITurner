//
//  WTAppDelegate.m
//  WIFITurner
//
//  Created by Timm Kandziora on 17.04.14.
//  Copyright (c) 2014 shinvou. All rights reserved.
//

#import "WTAppDelegate.h"

@implementation WTAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusItem.title = @"W";
    self.statusItem.highlightMode = YES;
    
    NSMenu *menu = [[NSMenu alloc] init];
    
    NSMenuItem *menuItemOne = [[NSMenuItem alloc] initWithTitle:@"Turn WLAN" action:@selector(turnWLANOffAndOn) keyEquivalent:@""];
    NSMenuItem *menuItemTwo = [[NSMenuItem alloc] initWithTitle:@"Launch at Login" action:@selector(openAtLoginToggled) keyEquivalent:@""];
    NSMenuItem *menuItemThree = [NSMenuItem separatorItem];
    NSMenuItem *menuItemFour = [[NSMenuItem alloc] initWithTitle:@"Quit" action:@selector(quitApp) keyEquivalent:@""];
    
    [menu addItem:menuItemOne];
    [menu addItem:menuItemTwo];
    [menu addItem:menuItemThree];
    [menu addItem:menuItemFour];
    
    [self.statusItem setMenu:menu];
}

- (void)turnWLANOffAndOn
{
    [self setPowerOff];
    [self performSelector:@selector(setPowerOn) withObject:nil afterDelay:3.0];
}

- (void)setPowerOff
{
    CWInterface *interface = [CWInterface interface];
    [interface setPower:NO error:nil];
}

- (void)setPowerOn
{
    CWInterface *interface = [CWInterface interface];
    [interface setPower:YES error:nil];
}

- (BOOL)startAtLogin
{
    return [WTLaunchManager willStartAtLogin:[self appURL]];
}

- (void)openAtLoginToggled
{
    [self setStartAtLogin:![self startAtLogin]];
}

- (void)setStartAtLogin:(BOOL)enabled
{
    [self willChangeValueForKey:@"startAtLogin"];
    [WTLaunchManager setStartAtLogin:[self appURL] enabled:enabled];
    [self didChangeValueForKey:@"startAtLogin"];
}

- (BOOL)validateUserInterfaceItem:(id <NSValidatedUserInterfaceItem>)item
{
    if ([item action] == @selector(openAtLoginToggled)) {
        if ([(NSMenuItem *)item respondsToSelector:@selector(setState:)]) {
            [(NSMenuItem *)item setState:[self startAtLogin]];
        }
    }
    
    return YES;
}

- (void)quitApp
{
    [NSApp terminate:self];
}

- (NSURL *)appURL
{
    return [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
}

@end
