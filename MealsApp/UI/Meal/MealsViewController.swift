//
//  MealsController.swift
//  MealsApp
//
//  Created by user247205 on 11/2/23.
//

import UIKit

class MealsViewController: UITableViewController {
    
    var meals = Meals()
    var category: String?
    
    func loadData() {
        
        guard let category = category else {
            return
        }
        
        MealService().getAll(category: category) { success, data, error in
            if success {
                self.meals = data!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }

        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        loadData()
    }

    func initView(){
        tableView.register(MealCell.nib, forCellReuseIdentifier: MealCell.identifier)
        tableView.allowsSelection = false
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MealCell.identifier, for: indexPath) as! MealCell
        cell.nameLabel.text = meals[indexPath.row].name
        cell.posterImageView.loadImage(from: meals[indexPath.row].imageUrl)
    
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
