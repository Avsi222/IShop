//
//  LoginViewController.swift
//  IShop
//
//  Created by Арсений Дорогин on 27/04/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textFieldUsername:UITextField!
    @IBOutlet weak var textFieldPassword:UITextField!
    
    @IBOutlet weak var squareView:UIView!
    
    
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        squareView.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender:UIButton){
        
        guard let username = textFieldUsername.text else{
            print("ОШИБКА: Логин")
            return
        }
        guard let password = textFieldPassword.text else{
            print("ОШИБКА: Логин")
            return
        }
        
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: username, password: password) { response in
            switch response.result {
            case .success(let login):
                print(login)
                print(login.user)
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "LoginOk", sender: nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
