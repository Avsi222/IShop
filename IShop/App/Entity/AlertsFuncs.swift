//
//  AlertsFuncs.swift
//  IShop
//
//  Created by Арсений Дорогин on 24/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Foundation
import UIKit

class alertFunc{
    
    class func showAlert(title:String,text:String,vc:UIViewController){
        let alert = UIAlertController(title: title, message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ок", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
