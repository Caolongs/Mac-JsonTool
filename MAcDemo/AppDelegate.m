//
//  AppDelegate.m
//  MAcDemo
//
//  Created by cao longjian on 16/11/5.
//  Copyright © 2016年 Jiji. All rights reserved.
//

#import "AppDelegate.h"
#import <Foundation/Foundation.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [NSApp setDelegate:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeWindow)name:NSWindowWillCloseNotification object:[NSApplication sharedApplication].mainWindow];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    
}

- (void)closeWindow

{
    [NSApp terminate:self];
    
}

//-(BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag
//
//{
//    if(theApplication.mainWindow == nil)
//        if(![NSStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]])
//            NSBeep();
//    
//    if(theApplication.mainWindow != nil)
//        [theApplication.mainWindow makeKeyAndOrderFront:nil];
//    //[theApplication.mainWindow makeKeyAndOrderFront:nil];
//    
//    return YES;
//    
//}




@end
