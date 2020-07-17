//
//  Coordinator.swift
//  ColleaguesApp
//
//  Created by Angelina on 17.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
}
