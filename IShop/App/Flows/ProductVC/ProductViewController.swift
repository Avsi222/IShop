//
//  ProductViewController.swift
//  IShop
//
//  Created by Арсений Дорогин on 12/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var labelNameProduct:UILabel!
    @IBOutlet weak var labelPriceProduct:UILabel!
    @IBOutlet weak var imageViewProduct:UIImageView!
    
    
    var productInfo:Product!
    
    var image:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        
        // Do any additional setup after loading the view.
    }
    
    func initData(){
        labelNameProduct.text = productInfo.product_name
        labelPriceProduct.text = "\(productInfo.price)"
        imageViewProduct.image = image
        //productInfo.imageUrl
    }

    
    @IBAction func addToCart(_ sender:UIButton){
        
        let requestFactory = RequestFactory()
        
        let cart = requestFactory.makeCartRequestFatory()
        
        cart.add_product_cart(id_product: productInfo.id, quantity: 1) { (response) in
            switch response.result {
                case .success(let result):
                print(result)
                let alert = UIAlertController(title: "Поздравляю", message: "Товар добавлен в корзину", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ок", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.destination is ReviewsTableViewController{
            let vc = segue.destination as! ReviewsTableViewController
            vc.idProduct = productInfo.id
        }
    }
    

}
