//
//  TabBarViewController.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 13/7/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        // Do any additional setup after loading the view.
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


extension TabBarViewController: UITabBarControllerDelegate {
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        navigationController?.isNavigationBarHidden = false
//    }
    
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        if viewController is HomeViewController {
//            print("HomeViewController")
//            self.navigationController?.isNavigationBarHidden = false
//        }
//        else if viewController is LiveTvViewController {
//            print("LiveTvViewController")
//            self.navigationController?.isNavigationBarHidden = false
//        }
//        else if viewController is OriginalsViewController {
//            print("OriginalsViewController")
//            self.navigationController?.isNavigationBarHidden = false
//        }
//        else if viewController is MyListViewController {
//            print("MyListViewController")
//            self.navigationController?.isNavigationBarHidden = false
//        }
//        else if viewController is ProfileViewController {
//            print("ProfileViewController")
//            self.navigationController?.isNavigationBarHidden = false
//        }
//        else {
//            print("UNKNOWN")
//        }
//    }
}

//
//extension MyListViewController: UITabBarDelegate {
//    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        navigationController?.isNavigationBarHidden = false
//    }
//}
