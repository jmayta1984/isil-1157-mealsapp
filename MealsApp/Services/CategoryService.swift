//
//  CategoryService.swift
//  MealsApp
//
//  Created by user247205 on 10/26/23.
//

import Foundation

protocol CategoryServiceProtocol {
    func getAll(completion: @escaping (_ success: Bool, _ results: Categories?, _ error: String? )-> Void)
}

class CategoryService: CategoryServiceProtocol {
    
    private let url = "https://www.themealdb.com/api/json/v1/1/categories.php"
    
    func getAll(completion: @escaping (Bool, Categories?, String?)-> Void) {
        HttpRequestHelper().GET(url: url) { success, data in
            
            if success {
                do {
                    let categoryWrapper = try JSONDecoder().decode(CategoryWrapper.self, from: data!)
                    let categories = categoryWrapper.categories
                    completion(true, categories, nil)
                } catch {
                    completion(false, nil, "Error: invalid JSON data")
                }
            } else {
                completion(false, nil, "Error: Categories GET request failed")
            }
        }
    }
}
