//
//  WTLaunchManager.h
//  WIFITurner
//
//  Created by Timm Kandziora on 17.04.14.
//  Copyright (c) 2014 shinvou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTLaunchManager : NSObject

+ (BOOL)willStartAtLogin:(NSURL *)itemURL;
+ (void)setStartAtLogin:(NSURL *)itemURL enabled:(BOOL)enabled;

@end
