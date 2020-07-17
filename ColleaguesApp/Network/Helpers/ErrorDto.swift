//
//  ErrorDto.swift
//  ColleaguesApp
//
//  Created by Angelina on 16.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import Foundation

struct DataObject: Codable {
    let errors: ErrorMessage?
}

struct ErrorMessage: Codable {
    let message: String?
}

struct ErrorDto: Codable {
    let data: DataObject?
    let errors: ErrorMessage?
    let code: Int

    func asString() -> String {
        if let dataErrorMsg = data?.errors?.message {

            return "\(dataErrorMsg)"
        }

        if let errorMsg = errors?.message {
            return "\(errorMsg)"
        }

        return "\(code)"
    }
}
