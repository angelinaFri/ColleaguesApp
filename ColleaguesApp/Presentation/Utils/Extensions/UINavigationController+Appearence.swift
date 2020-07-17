//
//  UINavigationController+Appearence.swift
//  ColleaguesApp
//
//  Created by Angelina on 17.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import UIKit

extension UINavigationController {
    @available(iOS 13.0, *)
    func barAppearance() {
        let navigationBar = self.navigationBar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.standardAppearance = appearance
    }

    @available(iOS 13.0, *)
    func setupDefaultNavigationBarAppearance() {
     // We will use UINavigationBar.appearance() to infer settings that
     // were already set by you to navigation bar in older versions of
     // iOS. Feel free to omit navigationBarAppearanceProxy and simply
     // set your own values if you don't support older versions or use
     // custom design specifically for iOS 13.
      let navigationBarAppearanceProxy = UINavigationBar.appearance()
      let appearance = UINavigationBarAppearance()
      appearance.backgroundColor = navigationBarAppearanceProxy.barTintColor
      appearance.largeTitleTextAttributes = navigationBarAppearanceProxy.largeTitleTextAttributes ?? [:]
      appearance.titleTextAttributes = navigationBarAppearanceProxy.titleTextAttributes ?? [:]
      navigationBarAppearanceProxy.scrollEdgeAppearance = appearance
      navigationBarAppearanceProxy.compactAppearance = appearance
      navigationBarAppearanceProxy.standardAppearance = appearance
    }
}
