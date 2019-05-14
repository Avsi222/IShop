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
    let baseUrl = URL(string: "http://localhost:8080/")!
    
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
    func add_Review(id_user: Int, text: String, completionHandler: @escaping (DataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, id_user: id_user, text: text)
        self.request(request: requestModel, completionHandler: completionHandler).session.finishTasksAndInvalidate()
    }
    
    func get_products(page_number: Int, id_category: Int, completionHandler: @escaping (DataResponse<ProductResult>) -> Void) {
        let requestModel = product(baseUrl: baseUrl, page_number: page_number, id_category: id_category)
        self.request(request: requestModel, completionHandler: completionHandler).session.finishTasksAndInvalidate()
    }
    func get_reviews(id_product: Int, completionHandler: @escaping (DataResponse<reviewsResult>) -> Void) {
        let requestModel = reviews(baseUrl: baseUrl, id_product: id_product)
        self.request(request: requestModel, completionHandler: completionHandler).session.finishTasksAndInvalidate()
    }
}

extension Catalog {
    struct product: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData"
        
        let page_number: Int
        let id_category: Int
        
        var parameters: Parameters? {
            return [
                "page_number": page_number,
                "id_category": id_category
            ]
        }
    }
    
    struct reviews: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getReviews"
        
        let id_product: Int
        
        var parameters: Parameters? {
            return [
                "id_product": id_product
            ]
        }
    }
    
    
    struct AddReview:RequestRouter {
        var baseUrl: URL
        
        let path: String = "addReview"
        
        let method: HTTPMethod = .get
        
        let id_user: Int
        let text: String
        
        var parameters: Parameters?{
            return [
                "id_user":id_user,
                "text":text,
            ]
        }
    }
    
}
