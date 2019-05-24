//
//  ProductCart.swift
//  IShop
//
//  Created by Арсений Дорогин on 17/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Foundation

struct productCart: Codable {
    let id_product:Int
    let product_name:String
    let price:Int
    let quantity:Int
    
    enum CodingKeys: String, CodingKey {
        case id_product = "id_product"
        case product_name = "product_name"
        case price
        case quantity
    }
    
}
/*
struct productCart: Decodable {
    let id_product:Int?
    let product_name:String?
    let price:Int?
    let quantity:Int?
    
    enum CodingKeys: String, CodingKey {
        case id_product = "id_product"
        case product_name = "product_name"
        case price
        case quantity
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id_product = try? container.decode(Int.self, forKey: .id_product)
        self.product_name = try? container.decode(String.self, forKey: .product_name)
        self.price = try? container.decode(Int.self, forKey: .price)
        self.quantity = try? container.decode(Int.self, forKey: .quantity)
        
        
    }

}*/
