//
//  UsersListViewModel.swift
//  ColleaguesApp
//
//  Created by Angelina on 17.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import Foundation

class UsersListViewModel {

// MARK: Private properties
    private var dataSource: DataResponse?
    private var usersDataFirstPage: [User]?
    private var usersDataSecondPage: [User]?
    private var totalUserData: [User]?
    private var adData: Ad?

// MARK: Business logic
    func numberOfItems(in section: Int) -> Int {
        return totalUserData?.count ?? 0
    }

    func getSource(at index: Int) -> User? {
        return totalUserData?[index]
    }

    func getAdSource(in section: Int) -> Ad? {
        return adData
    }

    func getUsersInfo(onSuccess: @escaping() -> Void, onFailed: @escaping(ErrorResult) -> Void) {

        let dispatchGroup = DispatchGroup()

        getFirstPage(with: dispatchGroup, page: 1) { (result) in
            switch result {
            case .success(let response):
                self.dataSource = response
                self.adData = response.ad
                self.usersDataFirstPage = response.users
                guard let _usersDataFirstPage = self.usersDataFirstPage else { return }
                self.totalUserData = [User]()
                self.totalUserData?.append(contentsOf: _usersDataFirstPage)
            case .failure(let error):
                print(error)
            }
        }

        dispatchGroup.notify(queue: .global()) {
            self.getSecondPage(page: 2) { (result) in
                switch result {
                case .success(let response):
                    self.dataSource = response
                    self.usersDataSecondPage = response.users
                    guard let _usersDataSecondPage = self.usersDataSecondPage else { return }
                    self.totalUserData?.append(contentsOf: _usersDataSecondPage)
                    self.totalUserData = self.totalUserData?.sorted {
                        var isSorted = false
                        isSorted = $0.lastName < $1.lastName
                        return isSorted
                    }
                    onSuccess()
                case .failure(let error):
                    onFailed(error)
                }
            }
        }
    }

    func getFirstPage(with dispatchGroup: DispatchGroup, page: Int, completion: ((Result<DataResponse, ErrorResult>) -> Void)? = nil) {
        dispatchGroup.enter()

        GetInfoService.init().getInfo(page: page) { (results) in
            switch results {
            case .success(let response):
                completion?(Result.success(response))
                dispatchGroup.leave()
            case .failure(let error):
                completion?(Result.failure(error))
                dispatchGroup.leave()
            }
        }
    }

    func getSecondPage(page: Int, completion: ((Result<DataResponse, ErrorResult>) -> Void)? = nil) {
        GetInfoService.init().getInfo(page: page) { (results) in
            switch results {
            case .success(let response):
                completion?(Result.success(response))
            case .failure(let error):
                completion?(Result.failure(error))
            }
        }
    }
}
