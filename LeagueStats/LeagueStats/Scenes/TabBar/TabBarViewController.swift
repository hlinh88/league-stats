//
//  TabBarViewController.swift
//  LeagueStats
//
//  Created by Hoang Linh Nguyen on 23/11/2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = UINavigationController(rootViewController: ChampionViewController())
        let secondVC = UINavigationController(rootViewController: ChampionViewController())

        let controllers = [firstVC, secondVC]

        self.setViewControllers(controllers, animated: false)
        
        configTabBar()
    }

    private func configTabBar() {
        guard let items = self.tabBar.items else { return }

        let images = ["helmet", "winning"]
        let titles = ["Champions", "Profile"]

        for index in 0...(items.count-1) {
                items[index].image = UIImage(named: images[index])
                items[index].selectedImage = UIImage(named: images[index])
                items[index].title = titles[index]
        }

        self.tabBar.backgroundColor = .black
        self.tabBar.tintColor = UIColor.white
        self.tabBar.unselectedItemTintColor = UIColor.lightGray
    }

    class func instantiateFromNib() -> TabBarViewController {
        let nib = UINib(nibName: "TabBarViewController", bundle: nil)
        if let tabBarVC = nib.instantiate(withOwner: nil, options: nil).first as? TabBarViewController {
            return tabBarVC
        }
        return TabBarViewController()
    }
}
