//
//  CatalogTableViewController.swift
//  IShop
//
//  Created by Арсений Дорогин on 27/04/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import UIKit

class CatalogTableViewController: UITableViewController {

    var products = [Product]()
    var imagesArray = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3")]
    
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loaddata()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func loaddata(){
        
        let catalog = requestFactory.makeCatalogRequestFatory()
        catalog.get_products(page_number: 1, id_category: 1) { (response) in
            switch response.result {
            case .success(let result):
                self.products = result
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
        return products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CatalogTableViewCell
        let productRow = products[indexPath.row]
        cell.labelNameProduct.text = productRow.product_name
        cell.labelPriceProduct.text = "\(productRow.price)"
        cell.imageViewProduct.image = imagesArray[indexPath.row]

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 138
    }
    
    
    var sendProductId = 0
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sendProductId = indexPath.row
        performSegue(withIdentifier: "productClick", sender: nil)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.destination is ProductViewController{
            let vc = segue.destination as! ProductViewController
            vc.image = imagesArray[sendProductId]
            vc.productInfo = products[sendProductId]
        }
    }
    

}
