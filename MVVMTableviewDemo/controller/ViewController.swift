//
//  ViewController.swift
//  MVVMTableviewDemo
//
//  Created by Qodors on 05/08/19.
//  Copyright © 2019 Qodors. All rights reserved.
//

import UIKit

enum ProfileSection: Int {
    case Time, WarmUp, CoolDown, Count
    
    static var count = {
        return ProfileSection.Count.rawValue
    }
    
    static let sectionTitles = [
        Time: "Time",
        WarmUp: "Warm Up",
        CoolDown: "Cool Down"
    ]
    
    func sectionTitle() -> String {
        if let sectionTitle = ProfileSection.sectionTitles[self] {
            return sectionTitle
        } else {
            return ""
        }
    }
    
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var profileViewModel: ProfileViewModel!
  
    @IBOutlet weak var tbl_profile: UITableView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileViewModel = ProfileViewModel(withProfile: Profile())
        
        tbl_profile.register(UINib(nibName: "ProfileSwitchTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileSwitchTableViewCell")
        
        tbl_profile.delegate = self
        tbl_profile.dataSource = self
        tbl_profile.reloadData()

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileSection.count()
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = ProfileSection(rawValue: section) else { return 1 }
        
        switch section {
        case .WarmUp:
            return profileViewModel.numberOfRowsForSegmentOfType(type: .WarmUp)
        default: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = ProfileSection(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .Time:
            return cellForTimeSectionForRowAtIndexPath(indexPath: indexPath as NSIndexPath)
        case .WarmUp:
            return cellForWarmUpSectionForRowAtIndexPath(indexPath: indexPath as NSIndexPath)
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = ProfileSection(rawValue: section) else { return "" }
        return section.sectionTitle()
    }

    private func cellForTimeSectionForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell {

        guard let cell = tbl_profile.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath as IndexPath) as? ProfileTableViewCell else {
            return UITableViewCell()
        }
    
        cell.detailTextLabel?.text = ""
        cell.textLabel?.text = profileViewModel.timeForProfile()
        
        return cell
    }
    
    private func cellForWarmUpSectionForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell {
        var result = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            if let cell = tbl_profile.dequeueReusableCell(withIdentifier: "ProfileSwitchTableViewCell", for: indexPath as IndexPath) as? ProfileSwitchTableViewCell {
                cell.mainlabel.text = "Enabled"
                cell.switchconrol.isOn = profileViewModel.segmentOfTypeEnabled(type: .WarmUp)
                
//                cell.switchControlHandler = { (sender) in
//                    self.profileViewModel.setSegmentOfType(.WarmUp, enabled: sender.on)
//                    
//                    if sender.on {
//                        // Insert Rows
//                        self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 1, inSection: indexPath.section)], withRowAnimation: .Top)
//                        
//                    } else {
//                        // Delete Rows
//                        self.tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: 1, inSection: indexPath.section)], withRowAnimation: .Top)
//                    }
//                }
                
                result = cell
            }
        default:
            if let cell =  tbl_profile.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath as IndexPath) as? ProfileTableViewCell {
                cell.detailTextLabel?.text = ""
                cell.textLabel?.text = profileViewModel.timeForSegmentOfType(type: .WarmUp)
                
                result = cell
            }
        }
        
        return result
    }
  
}

class  ProfileTableViewCell : UITableViewCell
{
   
}
