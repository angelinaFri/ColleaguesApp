//
//  GetInfoService.swift
//  ColleaguesApp
//
//  Created by Angelina on 16.07.2020.
//  Copyright © 2020 Angelina Friz. All rights reserved.
//

import Foundation

class GetInfoService: RequestHandler {

    func getInfo(page: Int, completion: @escaping((Result<DataResponse, ErrorResult>) -> Void)) {
        let url = String(format: Global.getUserList, page)
        APIService.init().get(urlString: url, completion: self.networkResult(completion: completion))
    }
}
