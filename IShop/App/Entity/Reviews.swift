//
//  Reviews.swift
//  IShop
//
//  Created by Арсений Дорогин on 13/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Foundation

struct Reviews: Codable {
    let id_user: Int
    let text: String
    let id_review:Int
    
    enum CodingKeys: String, CodingKey {
        case id_user = "id_user"
        case text = "text"
        case id_review = "id_review"
    }
}
