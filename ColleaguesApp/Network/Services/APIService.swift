//
//  APIService.swift
//  ColleaguesApp
//
//  Created by Angelina on 16.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import Foundation

typealias NetworkCompletionHandler = (Data?, URLResponse?, Error?) -> Void
typealias ErrorHandler = (String) -> Void

enum HttpMethod: String {
    case GET
}

class APIService {

    // MARK: Constants
     static let genericError = "Something went wrong. Please try again later"
     static let emptyResponse = "Unable to parse data. Empty response"
     static let wrongUrl = "Unable to create URL from given string"
     static let wrongUrlCode = 999

    func apiCall(urlString: String = "", method: HttpMethod, completion: @escaping (Result<Data, ErrorResult>) -> Void) {

        let completionHandler: NetworkCompletionHandler = { (data, urlResponse, error) in

            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.network(string: error.localizedDescription, code: self.getStatusCode(urlResponse))))
                return
            }

            if self.isSuccessCode(urlResponse) {
                guard let data = data else {
                    completion(.failure(.network(string: APIService.emptyResponse, code: self.getStatusCode(urlResponse))))
                    return
                }
                completion(.success(data))
            } else {
                guard let data = data else {
                    completion(.failure(.network(string: APIService.genericError, code: self.getStatusCode(urlResponse))))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let errorModel = try decoder.decode(ErrorDto.self, from: data)
                    completion(.failure(.custom(string: errorModel.asString(), code: errorModel.code)))
                } catch let parsingError {
                    print("Error", parsingError)
                    completion(.failure(.parser(string: APIService.genericError)))
                }
            }
        }

        guard let url = URL(string: urlString) else {
            completion(.failure(.network(string: APIService.wrongUrl, code: APIService.wrongUrlCode)))
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request, completionHandler: completionHandler)
        .resume()
    }

    func get(urlString: String = "", completion: @escaping (Result<Data, ErrorResult>) -> Void) {
        apiCall(urlString: urlString, method: .GET, completion: completion)
    }

    private func isSuccessCode(_ statusCode: Int) -> Bool {
        return statusCode >= 200 && statusCode < 300
    }

    private func isSuccessCode(_ response: URLResponse?) -> Bool {
        guard let urlResponse = response as? HTTPURLResponse else {
            return false
        }
        return isSuccessCode(getStatusCode(urlResponse))
    }

    private func getStatusCode(_ response: URLResponse?) -> Int {
          guard let urlResponse = response as? HTTPURLResponse else {
              return 0
          }

          return urlResponse.statusCode
      }
}
