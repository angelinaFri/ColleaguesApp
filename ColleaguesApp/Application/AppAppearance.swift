//
//  AppAppearance.swift
//  ColleaguesApp
//
//  Created by Angelina on 17.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import UIKit

final class AppAppearance {

    static func setupAppearance() {
        UINavigationBar.appearance().barTintColor = Constants.Colors.blue
        UINavigationBar.appearance().tintColor = Constants.Colors.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: Constants.Colors.white]
    }
}

extension UINavigationController {
    @objc override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

@available(iOS 13.0, *)

final class AppAppear {
    static func setupDefaultNavigationBarAppearance() {
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
