//
//  ProfileSwitchTableViewCell.swift
//  MVVMTableviewDemo
//
//  Created by Qodors on 05/08/19.
//  Copyright © 2019 Qodors. All rights reserved.
//

import UIKit

class ProfileSwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var switchconrol: UISwitch!
    @IBOutlet weak var mainlabel: UILabel!
    
    typealias completion = (Any) -> Void
    
    @IBAction func switchhandler(_ sender: Any) {
       
    }
    
    func switchcontrolHandler()
    {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
