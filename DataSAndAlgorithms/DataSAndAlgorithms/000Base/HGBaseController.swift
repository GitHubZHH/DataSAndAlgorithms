//
//  HGBaseController.swift
//  DataSAndAlgorithms
//
//  Created  by hong.zhu on 2019/6/8.
//  Copyright © 2019 HG. All rights reserved.
//

import UIKit

class HGBaseController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
