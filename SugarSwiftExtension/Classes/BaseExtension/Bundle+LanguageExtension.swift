//
//  Bundle+LanguageExtension.swift
//  SugarSwiftExtensions
//
//  Created by ZY on 19/08/07.
//  Copyright (c) 2019 ZY. All rights reserved.
//
// usage:
//        UserDefaults.standard["currentLanuage"] = Language.english.rawValue
//        Bundle.main.onLanguage()
//

enum Language: String {
    case english = "en"
    case chinese = "zh-Hans"
}

/**
 *  call onLanguage replace mainBundle as cuurent language bundle
 */

class BundleEx: Bundle {
    
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundle = Bundle.getLanguageBundel() {
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        } else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}


extension Bundle {
    
    private static var onLanguageDispatchOnce: () -> Void = {
        //replace Bundle.main as BundleEx
        object_setClass(Bundle.main, BundleEx.self)
    }
    
    func onLanguage() {
        Bundle.onLanguageDispatchOnce()
    }
    
    class func getLanguageBundel() -> Bundle? {
        let languageBundlePath = Bundle.main.path(forResource: UserDefaults.standard["currentLanuage"] as? String, ofType: "lproj")
        //        print("path = \(languageBundlePath)")
        guard languageBundlePath != nil else {
            return nil
        }
        let languageBundle = Bundle.init(path: languageBundlePath!)
        guard languageBundle != nil else {
            return nil
        }
        return languageBundle!
        
    }
    
}

extension UserDefaults {
    public subscript(key: String) -> Any? {
        get {
            return object(forKey: key)
        }
        set {
            set(newValue, forKey: key)
        }
    }
}
