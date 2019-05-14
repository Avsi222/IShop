//
//  NetworkManager.swift
//  IShop
//
//  Created by Арсений Дорогин on 13/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    var manager: SessionManager?
    
    init() {
        let configuration = URLSessionConfiguration.default
        manager = Alamofire.SessionManager(configuration: configuration)
    }
}
