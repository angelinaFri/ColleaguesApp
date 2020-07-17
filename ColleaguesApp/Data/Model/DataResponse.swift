//
//  DataResponse.swift
//  ColleaguesApp
//
//  Created by Angelina on 17.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import Foundation

// MARK: - DataResponse
struct DataResponse: Codable {
    let page, perPage, total, totalPages: Int
    let users: [User]
    let ad: Ad

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case users = "data"
        case ad
    }
}

