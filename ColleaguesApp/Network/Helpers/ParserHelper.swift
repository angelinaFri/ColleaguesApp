//
//  ParserHelper.swift
//  ColleaguesApp
//
//  Created by Angelina on 16.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import Foundation

protocol Parceable {
    static func parseObject(dictionary: [String: AnyObject]) -> Result<Self, ErrorResult>
}

final class ParserHelper {

    static func parse<T: Decodable>(data: Data, completion: (Result<T, ErrorResult>) -> Void) {

        do {
            let decoder = JSONDecoder()
            let responseObject = try decoder.decode(T.self, from:
                data)
            completion(.success(responseObject))
        } catch let parsingError {
            print("Error", parsingError)
            completion(.failure(.parser(string: "Unable to parse the json")))
        }

    }
}
