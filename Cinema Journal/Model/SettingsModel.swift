//
//  settingsModel.swift
//  Cinema Journal
//
//  Created by Homer on 11/12/20.
//

import Foundation

struct SettingsModel {
    var adult : Bool = false    
    let sections = [
        [NSLocalizedString("settings_adult", comment: "")],
        [NSLocalizedString("settings_about_me", comment: ""), NSLocalizedString("settings_hire_me", comment: "")]
    ]
}
