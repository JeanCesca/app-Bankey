//
//  MainViewController.swift
//  Bankey
//
//  Created by Jean Ricardo Cesca on 28/07/22.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupTabBar()
    }
    
    private func setupViews() {
        
        let summaryVC = UINavigationController(rootViewController: AccountSummaryViewController())
        let moneyVC = UINavigationController(rootViewController: MoveMoneyViewController())
        let moreVC = UINavigationController(rootViewController: MoreViewController())
        
        summaryVC.tabBarItem.image = UIImage(systemName: "list.dash.header.rectangle")
        moneyVC.tabBarItem.image = UIImage(systemName: "arrow.left.arrow.right")
        moreVC.tabBarItem.image = UIImage(systemName: "ellipsis.circle")
        
        summaryVC.tabBarItem.title = "Summary"
        moneyVC.tabBarItem.title = "Move Money"
        moreVC.tabBarItem.title = "More"
        
        summaryVC.navigationBar.barTintColor = UIColor(named: "color")
        
        setViewControllers([summaryVC, moneyVC, moreVC], animated: true)
    }
    
    private func setupTabBar() {
        tabBar.isTranslucent = false
    }
    
    private func hideNavigationBar(_ navigationBar: UINavigationBar) {
        let image = UIImage()
        navigationBar.shadowImage = image
        navigationBar.setBackgroundImage(image, for: .default)
        navigationBar.isTranslucent = false
    }

}

class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPink
    }
    
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemBlue
    }
    
}
