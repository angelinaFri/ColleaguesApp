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
        navigationController.pushViewController(vc, animated: false)
    }
}

