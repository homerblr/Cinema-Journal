//
//  settingsModel.swift
//  Cinema Journal
//
//  Created by Homer on 11/12/20.
//

import Foundation

struct SettingsModel {
    static var shared = SettingsModel()
    private let defaults = UserDefaults.standard
    private let defaultsKey = "AdultChecked"
    var adult : Bool = false
    let sections = [
        [NSLocalizedString("settings_adult", comment: "")],
        [NSLocalizedString("settings_about_me", comment: ""), NSLocalizedString("settings_hire_me", comment: "")]
    ]
    mutating func saveAdult() {
        adult = !adult
        defaults.setValue(adult, forKey: defaultsKey)
    }
    
    private init() {
        defaults.value(forKey: defaultsKey)
        adult = defaults.bool(forKey: defaultsKey)
    }
}
