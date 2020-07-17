//
//  UserDetailViewController.swift
//  ColleaguesApp
//
//  Created by Angelina on 17.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController, StoryboardInstantiable {

//MARK: - IBOutlets

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var emailTextView: UITextView!

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.rounded()
        avatarImage.circleImage()
        configureUI(user)

    }

    func configureUI(_ user: User) {
        cardView.rounded()
        avatarImage.circleImage()
        nameLbl.text = user.firstName
        lastNameLbl.text = user.lastName
        emailTextView.text = user.email
        avatarImage.load(url: URL(string: user.avatar)!)
    }

}
