//
//  CategoriesViewController.swift
//  MealsApp
//
//  Created by user247205 on 10/26/23.
//

import UIKit

class CategoriesViewController: UITableViewController {
    
    var categories = Categories()

    func loadData(){
        CategoryService().getAll() { success, data, error in
            if success {
                self.categories = data!
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
    
    func initView() {
        tableView.register(CategoryCell.nib, forCellReuseIdentifier: CategoryCell.identifier)
        tableView.allowsSelection = true
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.nameLabel.text = categories[indexPath.row].name
        cell.posterImageView.loadImage(from: categories[indexPath.row].imageUrl)
      
        return cell
    }
    


    /*
    // MARK: - Navigation

     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mealsViewController = MealsViewController(nibName: "MealsViewController", bundle: nil)
        mealsViewController.category = categories[indexPath.row].name
        self.navigationController?.pushViewController(mealsViewController, animated: true)
    }

}
