//
//  AuthRequestFactory.swift
//  IShop
//
//  Created by Арсений Дорогин on 26/04/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (DataResponse<LoginResult>) -> Void)
    
    func registation(userName: String, password: String, email: String, gender: String, credit_card: String, bio: String, completionHandler: @escaping (DataResponse<RegistrResult>) -> Void)
    
    func logout(idUser: String, completionHandler: @escaping (DataResponse<LogoutResult>) -> Void)
    
    func changeData(userName: String, password: String, email: String, gender: String, credit_card: String, bio: String, completionHandler: @escaping (DataResponse<ChangeDataResult>) -> Void)
    
}
