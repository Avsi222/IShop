//
//  CatalogueAndBacketRequestFactory.swift
//  IShop
//
//  Created by Арсений Дорогин on 27/04/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Foundation
import Alamofire

protocol CatalogueAndBacketRequestFactory {
    func get_products(page_number:Int,id_category:Int, completionHandler: @escaping (DataResponse<ProductResult>) -> Void)
    func add_Review(id_user:Int,text:String, completionHandler: @escaping (DataResponse<AddReviewResult>) -> Void)
     func get_reviews(id_product: Int, completionHandler: @escaping (DataResponse<reviewsResult>) -> Void)
}
