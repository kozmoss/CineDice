//
//  ViewController.swift
//  Netflix
//
//  Created by samet on 26.11.2024.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createTabbar()
    }
    
    
    func createTabbar() {
        let firstVc = UINavigationController(rootViewController: WelcomeViewController())
        let secondVc = UINavigationController(rootViewController: UpComingViewController())
        let thirdVc = UINavigationController(rootViewController: SearchViewController())
        let fourthVc = UINavigationController(rootViewController: DownloadViewController())
        
     
        firstVc.tabBarItem.image = UIImage(systemName: "house")
        secondVc.tabBarItem.image = UIImage(systemName: "play.circle")
        thirdVc.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        fourthVc.tabBarItem.image = UIImage(systemName: "arrow.down.circle")
        
        firstVc.title = "Home"
        secondVc.title = "Coming Soon"
        thirdVc.title = "Top Search"
        fourthVc.title = "Downloads"
        
        tabBar.tintColor = .label
        
        setViewControllers([firstVc,secondVc,thirdVc,fourthVc], animated: true)
    }


}

