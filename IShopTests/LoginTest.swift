//
//  LoginTest.swift
//  IShopTests
//
//  Created by Арсений Дорогин on 27/04/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import XCTest
@testable import IShop

class LoginTest: XCTestCase {

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_login_loginSuccesful() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        //ARRANGE
        let requestFactory = RequestFactory()
        let username:String = "Somebody"
        let password:String = "Mypassword"
        
        let id:Int = 123
        let login: String = "geekbrains"
        let name: String = "John"
        let lastname: String = "Doe"
        var usertest:User!
        let user = User(id: id, login: login, name: name, lastname: lastname)
        //ACT
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: username, password: password) { (response) in
            switch response.result {
            case .success(let login):
                print(login)
                usertest = login.user
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            //ASSERT
            assert(usertest.id == user.id,"Не вверный ID")
            assert(usertest.name == user.name,"Не вверное имя")
            assert(usertest.lastname == user.lastname,"Не вверная фамилия")
            assert(usertest.login == user.login,"Не вверный логин")
        }
        
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
