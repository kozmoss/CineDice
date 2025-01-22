//
//  ProfileViewController.swift
//  Cinedice
//
//  Created by samet on 14.12.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    let settingsButton = UIButton(type: .system)
    let settingsIcon = UIImage(systemName: "gearshape")?.withRenderingMode(.alwaysTemplate)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: settingsButton)
        settingsButton.setImage(settingsIcon, for: .normal)
        settingsButton.tintColor = .label
        settingsButton.addTarget(self, action: #selector(addTarget), for: .touchUpInside)
       

        // Do any additional setup after loading the view.
    }
    
    @objc func addTarget() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
