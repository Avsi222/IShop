//
//  CartRequestFactory.swift
//  IShop
//
//  Created by Арсений Дорогин on 17/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Foundation
import Alamofire

protocol CartRequestFactory {
    func get_cart(id_user:Int, completionHandler: @escaping (DataResponse<getBacketResult>) -> Void)
    func delete_product_cart(id_Prodcut:Int, completionHandler: @escaping (DataResponse<deleteFromCartResult>) -> Void)
    func add_product_cart(id_product: Int,quantity:Int, completionHandler: @escaping (DataResponse<addToCartResult>) -> Void)
}
