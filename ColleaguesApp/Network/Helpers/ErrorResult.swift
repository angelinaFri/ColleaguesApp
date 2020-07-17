//
//  ErrorResult.swift
//  ColleaguesApp
//
//  Created by Angelina on 16.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import Foundation

enum ErrorCodes: Int {
    case custom
    case parser
    case unknown
    case wrongUrl
    case sessionExpired
}

enum ErrorResult: Error {
    case network(string: String, code: Int)
    case parser(string: String)
    case custom(string: String, code: Int)
}

class AppError: NSError {
    static func create(_ error: ErrorResult) -> AppError {
        switch error {
        case .custom(let string, let code):
            return AppError(domain: "", code: code, userInfo: [NSLocalizedDescriptionKey: string])
        case .network(let string, let code):
            return AppError(domain: "", code: code, userInfo: [NSLocalizedDescriptionKey: string])
        case .parser(let string):
            return AppError(domain: "", code: ErrorCodes.parser.rawValue, userInfo: [NSLocalizedDescriptionKey: string])
        }
    }
}
