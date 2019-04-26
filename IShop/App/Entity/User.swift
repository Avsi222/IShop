//
//  User.swift
//  IShop
//
//  Created by Арсений Дорогин on 26/04/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastname: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}
