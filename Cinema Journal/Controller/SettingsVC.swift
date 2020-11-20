//
//  SettingsVC.swift
//  Cinema Journal
//
//  Created by Homer on 10/25/20.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let cellIdentifier = "settingsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset.top = 22
    }
}


//MARK:- Tableview Extensions
extension SettingsVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            UIApplication.shared.open(URL(string: Constants.settingsURLs.aboutMeURL)!, options: [:], completionHandler: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == 0 && indexPath.row == 0 {
            SettingsModel.shared.saveAdult()
            tableView.cellForRow(at: indexPath)?.accessoryType = SettingsModel.shared.adult ? .checkmark : .none
            return nil
        }
        
        return indexPath
    }
}



extension SettingsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsModel.shared.sections[section].count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsModel.shared.sections.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        customCell.textLabel?.text =  SettingsModel.shared.sections[indexPath.section][indexPath.row]
        
        if indexPath.section == 1 && indexPath.row == 0 {
            customCell.accessoryType.self = .disclosureIndicator
        }
        
        if indexPath.section == 0 && indexPath.row == 0 {
            customCell.accessoryType = SettingsModel.shared.adult ? .checkmark : .none
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
