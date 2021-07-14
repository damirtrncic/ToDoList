//
//  AppCoordinator.swift
//  ToDoList
//
//  Created by Luka Babovic on 10/07/2021.
//

import UIKit
class AppCoordinator{
    let window:UIWindow
    init(window : UIWindow=UIWindow(frame: UIScreen.main.bounds)) {
        self.window = window
    }
    func start(){
        let HomeVC = HomeViewController()
        HomeVC.delegate=self
        self.window.rootViewController=HomeVC
        self.window.makeKeyAndVisible()
    }
}
extension AppCoordinator:HomeViewControllerDelegate{
    func showDelete(_ content: Details) {
        let DeleteVC = DeleteViewController(detail: content)
        self.window.rootViewController?.present(DeleteVC, animated: true, completion: nil)
        
    }
    
    
}
