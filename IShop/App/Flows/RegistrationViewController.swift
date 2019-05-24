//
//  RegistrationViewController.swift
//  IShop
//
//  Created by Арсений Дорогин on 27/04/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    
    
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldGender: UITextField!
    @IBOutlet weak var textFieldCredicCard: UITextField!
    @IBOutlet weak var textFieldBio: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registrationButtonPressed(_ sender: Any) {
        
        let requestFactory = RequestFactory()
        
        let auth = requestFactory.makeAuthRequestFatory()
        
        guard let username = textFieldUsername.text else{
            print("ОШИБКА: логин")
            return
        }
        
        guard let password = textFieldPassword.text else{
            print("ОШИБКА: пароль")
            return
        }
        
        
        guard let email = textFieldEmail.text else{
            print("ОШИБКА: почта")
            return
        }
        
        guard let gender = textFieldGender.text else{
            print("ОШИБКА: пол")
            return
        }
        
        guard let credit_card = textFieldCredicCard.text else{
            print("ОШИБКА: кредитная карта")
            return
        }
        
        guard let bio = textFieldBio.text else{
            print("ОШИБКА: о себе")
            return
        }
        
        
        auth.registation(userName: username, password: password, email: email, gender: gender, credit_card: credit_card, bio: bio) { (response) in
            switch response.result {
            case .success(let result):
                print(result)
                alertFunc.showAlert(title: "Поздравляю", text: "Вы успешно зарегистрировались", vc: self)
                
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
