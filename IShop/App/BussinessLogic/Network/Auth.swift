//
//  Auth.swift
//  IShop
//
//  Created by Арсений Дорогин on 26/04/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    //let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
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

extension Auth: AuthRequestFactory {
    func changeData(userName: String, password: String, email: String, gender: String, credit_card: String, bio: String, completionHandler: @escaping (DataResponse<ChangeDataResult>) -> Void) {
        let requestModel = ChangeData(baseUrl: baseUrl, username: userName, password: password, email: email, gender: gender, credit_card: credit_card, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    func logout(idUser: String, completionHandler: @escaping (DataResponse<LogoutResult>) -> Void) {
        let requestModel = Logout(idUser: idUser, baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func login(userName: String, password: String, completionHandler: @escaping (DataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    func registation(userName: String, password: String, email: String, gender: String, credit_card: String, bio: String, completionHandler: @escaping (DataResponse<RegistrResult>) -> Void) {
        let requestModel = Registr(baseUrl: baseUrl, username: userName, password: password, email: email, gender: gender, credit_card: credit_card, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler).session.finishTasksAndInvalidate()
    }
}

extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "login"
        
        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "login": login,
                "password": password
            ]
        }
    }
    struct Logout: RequestRouter {
        
        let idUser: String
        
        var parameters: Parameters?{
            return [
                "iduser": idUser
            ]
        }
        
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout"
    }
    struct Registr:RequestRouter {
        var baseUrl: URL
        
        let path: String = "registration"
        
        let method: HTTPMethod = .post
        
        let username: String
        let password: String
        let email: String
        let gender: String
        let credit_card: String
        let bio: String
        //let id_user = 123
        
        var parameters: Parameters?{
            return [
                //"id_user":id_user,
                "login":username,
                "password":password,
                "email":email,
                "gender":gender,
                "credit_card":credit_card,
                "bio":bio
            ]
        }
    }
    
    struct ChangeData:RequestRouter {
        var baseUrl: URL
        
        let path: String = "changeUserData.json"
        
        let method: HTTPMethod = .get
        
        let username: String
        let password: String
        let email: String
        let gender: String
        let credit_card: String
        let bio: String
        
        var parameters: Parameters?{
            return [
                "username":username,
                "password":password,
                "email":email,
                "gender":gender,
                "credit_card":credit_card,
                "bio":bio
            ]
        }
    }
    
}
