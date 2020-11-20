//
//  settingsModel.swift
//  Cinema Journal
//
//  Created by Homer on 11/12/20.
//

import Foundation

struct SettingsModel {
    static var shared = SettingsModel()
    let defaults = UserDefaults.standard
    let defaultsKey = "AdultChecked"
    var adult : Bool = false
    let sections = [
        [NSLocalizedString("settings_adult", comment: "")],
        [NSLocalizedString("settings_about_me", comment: ""), NSLocalizedString("settings_hire_me", comment: "")]
    ]
    
    func updateAdult() {
        defaults.setValue(adult, forKey: defaultsKey)
    }
    
    private init() {
        defaults.value(forKey: defaultsKey)
        adult = defaults.bool(forKey: defaultsKey)
    }
}
