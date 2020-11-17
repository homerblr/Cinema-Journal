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
        [NSLocalizedString("settings_aboutMe", comment: ""), NSLocalizedString("settings_hireMe", comment: "")]
    ]
}
