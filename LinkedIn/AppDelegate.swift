//
//  AppDelegate.swift
//  LinkedIn
//
//  Created by Joshua Bell on 3/1/16.
//  Copyright © 2016 Joshua Bell. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        application.applicationIconBadgeNumber = 39402
        self.launchLinkedInApp( application )
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        self.launchLinkedInApp( application )
    }

    func launchLinkedInApp( application: UIApplication ) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.02 * Double(NSEC_PER_SEC)))
        dispatch_after( delayTime, dispatch_get_main_queue()) {
            let uberAppURL = NSURL.init( string:"linkedin://")
            if application.canOpenURL(uberAppURL!) {
                application.openURL(uberAppURL!)
            } else {
                let uberWebURL = NSURL.init( string:"https://www.linkedin.com")
                application.openURL( uberWebURL! )
            }
        }
    }

}

