//
//  Sugar.swift
//  SugarSwiftExtensions
//
//  Created by ZY on 19/08/07.
//  Copyright (c) 2019 ZY. All rights reserved.
//

import Foundation

public struct Sugar {
    
    ///screen width
    public static var screen_width     = UIScreen.main.bounds.width
    
    ///screen height
    public static var screen_height    = UIScreen.main.bounds.height

    ///statusbar height
    public static var statusbar_height = UIApplication.shared.statusBarFrame.height
    
    ///  Returns app's name
    public static var appDisplayName: String? {
        if let bundleDisplayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            return bundleDisplayName
        } else if let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            return bundleName
        }
        
        return nil
    }
    
    ///  Returns app's version number
    public static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    ///  Return app's build number
    public static var appBuild: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    ///  Return app's bundle ID
    public static var appBundleID: String? {
        return Bundle.main.bundleIdentifier
    }
    
    ///  Return device version ""
    public static var deviceVersion: String {
        var size: Int = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0, count: Int(size))
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return String(cString: machine)
    }
    
    /// Returns true if its simulator and not a device
    public static var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
    
    /// Returns true if its on a device and not a simulator
    public static var isDevice: Bool {
        #if targetEnvironment(simulator)
        return false
        #else
        return true
        #endif
    }

}


