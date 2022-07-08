//
//  ViewController.swift
//  Netflix_Clone_NoStoryBoard
//
//  Created by 이창형 on 2022/07/08.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        // MARK: 탭바 설정
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())

        // 탭바 아이템 설정
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top Search"
        vc4.title = "Downloads"
        
        // 탭바 색 변경
        tabBar.tintColor = .label
        
        // animated는 애니메이션을 주냐 마냐
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }


}

