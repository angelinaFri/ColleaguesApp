//
//  ViewController.swift
//  ColleaguesApp
//
//  Created by Angelina on 16.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import UIKit

class UsersListViewController: UIViewController, StoryboardInstantiable {

    //MARK: - IBOutlets
    @IBOutlet weak var usersListTableView: UITableView!

    // MARK: Private properties
    private var viewModel: UsersListViewModel!

    var showUserDetail: ((User) -> Void)?
    var linkUrl = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = UsersListViewModel()
        loadUsersData()
        usersListTableView.delegate = self
        usersListTableView.dataSource = self
        configureNavigationBar()
        configureViewFromNibs()
    }

    func configureNavigationBar() {
        self.title = Constants.Strings.titleName
    }

    func configureViewFromNibs() {
        usersListTableView.register(cellType: UserCell.self)
        usersListTableView.register(headerType: CustomHeader.self)
    }

    func loadUsersData() {
        self.showSpinner(onView: self.view)
        viewModel.getUsersInfo(onSuccess: {
            DispatchQueue.main.async {
                self.usersListTableView.reloadData()
                self.removeSpinner()
            }

        }) { (error) in
            self.removeSpinner()
            self.showAlert(withTitle: "\(error.localizedDescription)", withMessage: "We already know and fixing the issue, please try later")
        }
    }
}

//MARK: - TableView Delegate Methods
extension UsersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.Sizes.cellHeight
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.Sizes.headerHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _user = viewModel.getSource(at: indexPath.row) else { return }
        showUserDetail?(_user)
    }
}

//MARK: - TableView DataSource Methods
extension UsersListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usersListTableView.dequeueReusableCell(with: UserCell.self, for: indexPath)
        let user = viewModel.getSource(at: indexPath.row)
        guard let _user = user else { return UITableViewCell()}
        cell.nameLabel.text = _user.firstName
        cell.surnameLabel.text = _user.lastName
        cell.avatarImage.load(url: URL(string: _user.avatar)!)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = usersListTableView.dequeueReusableHeader(with: CustomHeader.self)
        let ad = viewModel.getAdSource(in: section)
        guard let _ad = ad else { return UIView() }
        linkUrl = _ad.url
        headerView.companyNameLabel.text = _ad.company
        headerView.companyInfoTextView.delegate = self
        headerView.companyInfoTextView.hyperLink(originalText: "\(_ad.text)", hyperLink: "\(_ad.text)", urlString: linkUrl)
        return headerView
    }
}

//MARK: - TableView TextViewDelegateMethod
extension UsersListViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        if (URL.absoluteString == linkUrl) {
            UIApplication.shared.open(URL)
        }
        return false
    }
}


