//
//  APIConstants.swift
//  ColleaguesApp
//
//  Created by Angelina on 16.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import Foundation

struct Global {
    // MARK: Basic URL
    static let API_URL = "https://reqres.in/api"

    // MARK: Endpoints
    static let API_GET_USER_LIST = "/users?page=%d"

    // MARK: URLs
    static let getUserList = Global.API_URL + Global.API_GET_USER_LIST
}
