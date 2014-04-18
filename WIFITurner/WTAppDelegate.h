//
//  WTAppDelegate.h
//  WIFITurner
//
//  Created by Timm Kandziora on 17.04.14.
//  Copyright (c) 2014 shinvou. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreWLAN/CoreWLAN.h>
#import "WTLaunchManager.h"

@interface WTAppDelegate : NSObject <NSApplicationDelegate>

@property (strong, nonatomic) NSStatusItem *statusItem;

@end
