//
//  Catalogue.swift
//  IShop
//
//  Created by Арсений Дорогин on 27/04/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Foundation
import Alamofire

class Catalog: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: SessionManager,
        queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Catalog: CatalogueAndBacketRequestFactory {
    func get_products(page_number: Int, id_category: Int, completionHandler: @escaping (DataResponse<ProductResult>) -> Void) {
        let requestModel = product(baseUrl: baseUrl, page_number: page_number, id_category: id_category)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Catalog {
    struct product: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        
        let page_number: Int
        let id_category: Int
        
        var parameters: Parameters? {
            return [
                "page_number": page_number,
                "id_category": id_category
            ]
        }
    }
    
}
