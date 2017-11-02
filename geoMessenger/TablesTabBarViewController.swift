//
//  TablesTabBarViewController.swift
//  geoMessenger
//
//  Created by Hong Gao on 11/2/17.
//  Copyright © 2017 Hong Gao. All rights reserved.
//

import UIKit

class TablesTabBarViewController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBar.barTintColor = UIColor(red:0.70, green:0.97, blue:0.91, alpha:1.0)
        
        // how to convert hex value to UIcolor
        //http://uicolor.xyz/#/hex-to-ui
        
        //equivalent to: #3498db
    }
    
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


