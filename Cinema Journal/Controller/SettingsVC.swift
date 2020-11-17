//
//  SettingsVC.swift
//  Cinema Journal
//
//  Created by Homer on 10/25/20.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var settingsModel = SettingsModel()
    let defaults = UserDefaults.standard
    let defaultsKey = "AdultChecked"
    let cellIdentifier = "settingsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsModel.adult = defaults.bool(forKey: defaultsKey)
        tableView.contentInset.top = 22
    }
}


//MARK:- Tableview Extensions
extension SettingsVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == 0 && indexPath.row == 0 {
            settingsModel.adult = !settingsModel.adult
            defaults.set(settingsModel.adult, forKey: defaultsKey)
            tableView.cellForRow(at: indexPath)?.accessoryType = settingsModel.adult ? .checkmark : .none
            return nil
        }
        tableView.reloadData()
        return indexPath
    }
}



extension SettingsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return settingsModel.sections[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return settingsModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        customCell.textLabel?.text = settingsModel.sections[indexPath.section][indexPath.row]
        
        if indexPath.section == 1 && indexPath.row == 0 {
            customCell.accessoryType.self = .disclosureIndicator
        }
        
        if indexPath.section == 0 && indexPath.row == 0 {
            customCell.accessoryType = settingsModel.adult ? .checkmark : .none
        }
        return customCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return nil
        } else {
            return NSLocalizedString("about_developer", comment: "")
        }
        
    }
    
}
