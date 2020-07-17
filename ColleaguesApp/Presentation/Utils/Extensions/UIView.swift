//
//  UIView.swift
//  ColleaguesApp
//
//  Created by Angelina on 17.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import UIKit

extension UIView {
    func rounded() {
        self.layer.cornerRadius = Constants.Radius.cellCornerRadius
        self.clipsToBounds = true
        self.layer.borderColor = Constants.Colors.lightBlueOpacity.cgColor
        self.layer.borderWidth = Constants.Width.cellViewBorderWidth
    }
}
