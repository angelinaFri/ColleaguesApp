//
//  UITableHeaderForFooterView+UINib.swift
//  ColleaguesApp
//
//  Created by Angelina on 17.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import UIKit

public extension UITableView {
    func register<T: UITableViewHeaderFooterView>(headerType: T.Type, bundle: Bundle? = nil) {
        let className = headerType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forHeaderFooterViewReuseIdentifier: className)
    }

    func dequeueReusableHeader<T: UITableViewHeaderFooterView>(with type: T.Type) -> T {
        return self.dequeueReusableHeaderFooterView(withIdentifier: type.className) as! T
    }
}
