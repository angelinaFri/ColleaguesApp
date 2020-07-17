//
//  RequestHandler.swift
//  ColleaguesApp
//
//  Created by Angelina on 16.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import Foundation

class RequestHandler {

    func networkResult<T: Decodable>(completion: @escaping ((Result<T, ErrorResult>) -> Void)) ->
        ((Result<Data, ErrorResult>) -> Void) {

            return { dataResult in

                DispatchQueue.global(qos: .background).async(execute: {
                    switch dataResult {
                    case .success(let data) :
                        ParserHelper.parse(data: data, completion: completion)
                    case .failure(let error) :
                        completion(.failure(error))
                    }
                })
        }
    }
}
