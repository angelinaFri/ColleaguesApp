//
//  MainCoordinator.swift
//  ColleaguesApp
//
//  Created by Angelina on 17.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = UsersListViewController.instantiate()
        vc.showUserDetail = show(_:)
        navigationController.pushViewController(vc, animated: false)
    }

    func show(_ user: User) {
        let detailVC = UserDetailViewController.instantiate()
        detailVC.user = user
        navigationController.pushViewController(detailVC, animated: true)
    }
}

