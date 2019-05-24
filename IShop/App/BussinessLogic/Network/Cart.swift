//
//  Cart.swift
//  IShop
//
//  Created by Арсений Дорогин on 17/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//


import Foundation
import Alamofire

class Cart: AbstractRequestFactory {
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

extension Cart: CartRequestFactory {
    func get_cart(id_user: Int, completionHandler: @escaping (DataResponse<getBacketResult>) -> Void) {
        let requestModel = cart_router(baseUrl: baseUrl, id_user: id_user)
        self.request(request: requestModel, completionHandler: completionHandler).session.finishTasksAndInvalidate()
    }
    
    func delete_product_cart(id_Prodcut: Int, completionHandler: @escaping (DataResponse<deleteFromCartResult>) -> Void) {
        
        let requestModel = delete_cart(baseUrl: baseUrl, id_product: id_Prodcut)
        self.request(request: requestModel, completionHandler: completionHandler).session.finishTasksAndInvalidate()
    }
    
    func add_product_cart(id_product: Int, quantity: Int, completionHandler: @escaping (DataResponse<addToCartResult>) -> Void) {
        
        let requestModel = add_cart(baseUrl: baseUrl, id_product: id_product, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler).session.finishTasksAndInvalidate()
    }
    
}

extension Cart {
    struct cart_router: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getCart"
        
        let id_user: Int
        
        var parameters: Parameters? {
            return [
                "id_user": id_user
            ]
        }
    }
    
    struct delete_cart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "deleteProductCart"
        
        let id_product: Int
        
        var parameters: Parameters? {
            return [
                "id_product": id_product
            ]
        }
    }
    
    
    struct add_cart:RequestRouter {
        var baseUrl: URL
        
        let path: String = "addToCart"
        
        let method: HTTPMethod = .get
        
        let id_product: Int
        let quantity: Int
        
        var parameters: Parameters?{
            return [
                "id_product":id_product,
                "quantity":quantity,
            ]
        }
    }
    
}
