//
//  ShopCartTableViewController.swift
//  IShop
//
//  Created by Арсений Дорогин on 14/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import UIKit

class ShopCartTableViewController: UITableViewController {

    
    var cartArray = [productCart]()
    
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        loaddata()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    @IBAction func payedButtPressed(_ sender:UIButton){
        alertFunc.showAlert(title: "Поздравляю", text: "Заказ оплачен", vc:  self)
    }
    
    func loaddata(){
        
        let cart = requestFactory.makeCartRequestFatory()
        cart.get_cart(id_user: 1) { (response) in
            switch response.result {
            case .success(let result):
                self.cartArray = result
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cartArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CartTableViewCell
        let row = indexPath.row
        cell.labelNameProduct.text = cartArray[row].product_name
        cell.labelPriceProduct.text = "\(cartArray[row].price)"
        cell.labelQuantityProduct.text = "\(cartArray[row].quantity)"
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //deleteProduct(id_product:cartArray[indexPath.row].id_product)
            cartArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func deleteProduct(id_product:Int){
        
        let cart = requestFactory.makeCartRequestFatory()
        cart.delete_product_cart(id_Prodcut: id_product) { (response) in
            switch response.result {
            case .success(let result):
                print("Товар удален из базы")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
