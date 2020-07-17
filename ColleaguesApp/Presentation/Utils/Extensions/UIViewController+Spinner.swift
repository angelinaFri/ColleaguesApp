//
//  UIViewController+Spinner.swift
//  ColleaguesApp
//
//  Created by Angelina on 17.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import UIKit

extension UIViewController {

    struct Holder {
        static var _vSpinner: UIView = UIView()
    }

    var vSpinner: UIView? {
        get {
            return Holder._vSpinner
        }
        set(newValue) {
            Holder._vSpinner = newValue ?? UIView()
        }
    }

    func showSpinner(onView: UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8470588235)
        var ai = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            ai = UIActivityIndicatorView(style: .medium)

        } else {
            ai = UIActivityIndicatorView(style: .gray)
        }
        ai.color = Constants.Colors.darkRed
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }

        vSpinner = spinnerView
    }

    func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
}
