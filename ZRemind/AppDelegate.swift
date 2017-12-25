//
//  AppDelegate.swift
//  ZRemind
//
//  Created by ZHENGSHOUDONG on 2017/12/25.
//  Copyright © 2017年 ZHENGSHOUDONG. All rights reserved.
//

import Cocoa
import SwiftyTimer

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSUserNotificationCenterDelegate {
    
    var timer: Timer?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSUserNotificationCenter.default.delegate = self
        
        weak var weakSelf = self
        // setting timer
        timer = Timer.every(20.minutes) { // seconds  // minutes
            weakSelf!.sendNotification(string: "20分钟已到,喝水!!闭眼五秒钟!!")
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false
    }
    
    // quit app
    func quit() {
        NSApplication.shared.terminate(self)
    }
    
    // send notification
    func sendNotification(string: String) {
        let notification = NSUserNotification()
        notification.title = "ZRemind"
        notification.informativeText = string
        notification.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.default.deliver(notification)
    }
    
}

