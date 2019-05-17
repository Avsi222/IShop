//
//  ReviewsTableViewController.swift
//  IShop
//
//  Created by Арсений Дорогин on 13/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import UIKit

class ReviewsTableViewController: UITableViewController {

    var reviewsArray = [Reviews]()
    var idProduct = 0
    
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        loaddata()
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(addReviewPress))
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }

    @objc func addReviewPress(_ sender: UIButton){
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Отзыв", message: "Напишите ваш отызв", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            self.sendReview(text: textField!.text!)
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    func sendReview(text:String){
        
        let requestFactory = RequestFactory()
        
        let review = requestFactory.makeCatalogRequestFatory()
        
        review.add_Review(id_user: 1, text: text) { (response) in
            switch response.result {
            case .success(let result):
                print(result)
                self.reviewsArray.append(Reviews(id_user: 1, text: text, id_review: 1))
                let alert = UIAlertController(title: "Поздравляю", message: "Вы оставили отзыв", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ок", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func loaddata(){
        let catalog = requestFactory.makeCatalogRequestFatory()
        catalog.get_reviews(id_product: idProduct) { (response) in
            switch response.result {
            case .success(let result):
                self.reviewsArray = result
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
        return reviewsArray.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ReviewsTableViewCell
        cell.labelText.text = reviewsArray[indexPath.row].text
        cell.labelIdUser.text = "\(reviewsArray[indexPath.row].id_user)"
        // Configure the cell...

        return cell
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
            reviewsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
