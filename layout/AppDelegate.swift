//
//  AppDelegate.swift
//  layout
//
//  Created by Jakob Vinther-Larsen on 11/08/15.
//  Copyright © 2015 Vinther-moen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)

//        window?.rootViewController = StackViewAnimatedViewController()
//        window?.rootViewController = StackViewStaticViewController()
//        window?.rootViewController = ConstraintsAnimatedViewController()
        window?.rootViewController = ConstraintsStaticViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

