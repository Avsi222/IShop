//
//  Cart.swift
//  IShop
//
//  Created by Арсений Дорогин on 14/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Foundation

struct addToCartResult: Codable {
    let result: Int
}

struct deleteFromCartResult: Codable {
    let result: Int
}

typealias getBacketResult = [productCart]



