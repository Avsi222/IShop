//
//  Product.swift
//  IShop
//
//  Created by Арсений Дорогин on 27/04/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Foundation

struct Product: Codable {
    let id: Int
    let product_name: String
    let price: Int
    //let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case product_name = "product_name"
        case price
        //case imageUrl
    }
}
