//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Steven Leyva on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferencekey: String = ""

    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        let themePreference = userDefaults.string(forKey: themePreferencekey)
        return themePreference
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferencekey)
    }
    
    func setThemePreferenceToYourColorHere() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Grey", forKey: themePreferencekey)
    }
}
